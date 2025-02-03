import json
import logging
import os
import plotly.io
import multiprocessing
import threading
import time
import tkinter
from copy import deepcopy
from pathlib import Path
from tkinter import filedialog
import pandas as pd

import dash_bootstrap_components as dbc
import numpy as np
from astropy.constants import GM_earth
from dash import ALL, Dash, Input, Output, State, callback_context, dcc, html

from odtk_utilities.odtk_instance import OdtkInstance, OdtkType # isort:skip
import odtk_monte_toolbox.Data_Manage_Tbx as dmtbx
import odtk_monte_toolbox.Data_Processing_Tbx as dptbx
import odtk_monte_toolbox.Logging_Tbx as logtbx
import odtk_monte_toolbox.Run_Tbx as runtbx
from odtk_monte_gui.component_generator import (
    generate_button,
    generate_input_box,
    generate_path_box,
)

logger = logging.getLogger("odtk_monte_dash_app")


def save_content(
    run_type,
    run_name,
    sat_name,
    num_trials,
    num_ods,
    revs_per_od,
    conv_revs,
    pred_revs,
    scenario_path,
    output_path,
    app_type,
    epoch,
    semi_major_axis,
    eccentricity,
    true_arg_of_lat,
    inclination,
    raan,
    argument_of_perigee,
    r_sigma,
    i_sigma,
    c_sigma,
    rdot_sigma,
    idot_sigma,
    cdot_sigma,
    parallel_thread_count,
    perturbations,
):
    if output_path and run_name:
        run_dict = {
            "run_type": run_type,
            "run_name": run_name,
            "sat_name": sat_name,
            "num_trials": num_trials,
            "num_ods": num_ods,
            "revs_per_od": revs_per_od,
            "conv_revs": conv_revs,
            "pred_revs": pred_revs,
            "scenario_path": scenario_path,
            "output_path": output_path,
            "app_type": app_type,
            "epoch": epoch,
            "semi-major_axis": semi_major_axis,
            "eccentricity": eccentricity,
            "true_arg_of_lat": true_arg_of_lat,
            "inclination": inclination,
            "raan": raan,
            "argofperigee": argument_of_perigee,
            "r_sigma": r_sigma,
            "i_sigma": i_sigma,
            "c_sigma": c_sigma,
            "rdot_sigma": rdot_sigma,
            "idot_sigma": idot_sigma,
            "cdot_sigma": cdot_sigma,
            "parallel_thread_count": parallel_thread_count,
            "perturbations": perturbations,
        }

        output_file = Path(output_path) / run_name
        output_file.mkdir(exist_ok=True, parents=True)
        run_config_file = output_file / f"{run_name}.json"
        with run_config_file.open("w") as run_json:
            json.dump(run_dict, run_json, indent=4)


class DashApp:
    def __init__(self) -> None:
        self.app = Dash(
            external_stylesheets=[dbc.themes.SANDSTONE],
            suppress_callback_exceptions=True,
        )
        self.loglist = []
        self.percentComplete = [0]
        self.odtk = None
        self.client = None
        self.scenario = None
        self.scenarios = []
        self.satellites = []
        self.odtk_instances = []
        self.trialDict = pd.DataFrame()
        self.initState = []
        self.initUnc = []
        self.analysis_meta = None
        self.analysis_path = None
        self.logger = logging.getLogger("odtk_monte_dash_app")

        # All tabs styles
        universal_tab_style = {
            "margin": "10px",
            "width": "98%",
            "align": "center",
            "justify": "center",
            "text-align": "center",
        }

        text_align_style = {"text-align": "left", "margin": "10", "margin-bottom": 0}

        dropdown_style = {
            "width": "100%",
            "margin": 10,
            "margin-left": 0,
            "margin-right": 0,
        }

        # Tab 1 specific styles
        dropdown_sat_select_style = {
            "width": "75%",
            "margin": 10,
            "margin-left": 0,
            "margin-right": 0,
        }

        # Tab 2 specific styles
        big_dumpy_style ={
            "height": "85vh",
            "margin": "10px",
            "resize": "none",
        }

        big_dumpy_progress_style = {
            "margin": "10px",
            "height": "25px",
            "resize": "none",
        }

        # Tab 3 specific styles
        trial_metadata_style = {
            "width": "100%",
            "display": "inline-block",
            "height": "60vh",
            "margin": 0,
            "resize": "none",
        }

        run_metadata_style = {
            "width": "100%",
            "height": "10vh",
            "display": "inline-block",
            "margin": 0,
            "resize": "none",
        }

        # Needs self as it is called in a separate function
        self.plot_style = {
            "float": "center",
            "width": "100%",
            "height": 600,  # must be pixel value not %
        }

        text_align_style = {"text-align": "left", "margin": "10", "margin-bottom": 0}

        multi_truth_pert = [{"label": "SRP", "value": "srp"},
                            {"label": "Ballistic Coef", "value": "bcoef"},
                            {"label": "Measurement Bias", "value": "measbias"},
                            {"label": "Tropo Bias", "value": "tropobias"},
                            ]
        multi_truth_vals = ["srp", "bcoef", "measbias", "tropobias"]

        single_truth_pert = [{"label": "CrA/M", "value": "cram"},
                            {"label": "CrA/M long sigma", "value": "cramls"},
                            {"label": "CrA/M short sigma", "value": "cramss"},
                            {"label": "CrA/M half life", "value": "cramhl"},
                            {"label": "Ballistic Coef", "value": "bcoef"},
                            {"label": "Ballistic Coef long sigma", "value": "bcoefls"},
                            {"label": "Ballistic Coef short sigma", "value": "bcoefss"},
                            {"label": "Ballistic Coef half life", "value": "bcoefhl"},
                            {"label": "Measurement Bias", "value": "measbias"},]
        single_truth_vals = ["cram", "cramls", "cramss", "cramhl", "bcoef", "bcoefls", "bcoefss", "bcoefhl", "measbias"]

        satellite_items = []
        trial_items = []

        runner_params_div = html.Div(
            id="run_params",
            children=[
                dbc.Row(
                    [
                        dbc.Col(
                            [
                                html.H3(
                                    "Run Configuration", style=text_align_style
                                ),
                                html.P("Run Name", style=text_align_style),
                                generate_input_box(
                                    id="run-name",
                                    placeholder="Unique Run Name",
                                    input_type="text",
                                    value=None,
                                ),
                                html.P("Satellite name", style=text_align_style),
                                dbc.Select(
                                    id="sat-name",
                                    options=satellite_items,
                                    value=None,
                                    style=dropdown_sat_select_style,
                                    disabled=True,
                                ),
                                html.P(
                                    "Number of trials", style=text_align_style
                                ),
                                generate_input_box(
                                    id="num-trials",
                                    placeholder="Number of trials to run",
                                    input_type="number",
                                    step="1",
                                    value=None,
                                ),
                                html.P(
                                    "Predict revolutions", style=text_align_style
                                ),
                                generate_input_box(
                                    id="pred-revs",
                                    placeholder="Number of revs to predict",
                                    input_type="number",
                                    step="1",
                                    value=None,
                                ),
                                html.P("ODs per trial", style=text_align_style),
                                generate_input_box(
                                    id="num-ods",
                                    placeholder="ODs to run per trial",
                                    input_type="number",
                                    step="1",
                                    value=None,
                                ),
                                html.P(
                                    "Revolutions per OD", style=text_align_style
                                ),
                                generate_input_box(
                                    id="revs-per-od",
                                    placeholder="Number of revs per OD",
                                    input_type="number",
                                    step="1",
                                    value=None,
                                ),
                                html.P(
                                    "Convergence revolutions",
                                    style=text_align_style,
                                ),
                                generate_input_box(
                                    id="conv-revs",
                                    placeholder="Number of revs for convergence",
                                    input_type="number",
                                    step="1",
                                    value=None,
                                ),
                            ],
                            width=3,
                        ),
                        dbc.Col(
                            [
                                html.H3("Initial State", style=text_align_style),
                                html.P("Epoch (UTCG)", style=text_align_style),
                                generate_input_box(
                                    id="epoch",
                                    input_type="text",
                                    disabled=True,
                                    value=None,
                                ),
                                html.P(
                                    "Semi-major axis (km)", style=text_align_style
                                ),
                                generate_input_box(
                                    id="semi-major_axis",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P("Eccentricity", style=text_align_style),
                                generate_input_box(
                                    id="eccentricity",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "True argument of latitude (deg)",
                                    style=text_align_style,
                                ),
                                generate_input_box(
                                    id="true_arg_of_lat",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "Inclination (deg)", style=text_align_style
                                ),
                                generate_input_box(
                                    id="inclination",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P("RAAN (deg)", style=text_align_style),
                                generate_input_box(
                                    id="raan",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "Argument of perigee (deg)",
                                    style=text_align_style,
                                ),
                                generate_input_box(
                                    id="argofperigee",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                            ],
                            width=3,
                        ),
                        dbc.Col(
                            [
                                html.H3("Uncertainty", style=text_align_style),
                                html.P("R Sigma (m)", style=text_align_style),
                                generate_input_box(
                                    id="r_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P("I Sigma (m)", style=text_align_style),
                                generate_input_box(
                                    id="i_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P("C Sigma (m)", style=text_align_style),
                                generate_input_box(
                                    id="c_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "Rdot Sigma (m/s)", style=text_align_style
                                ),
                                generate_input_box(
                                    id="rdot_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "Idot Sigma (m/s)", style=text_align_style
                                ),
                                generate_input_box(
                                    id="idot_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                                html.P(
                                    "Cdot Sigma (m/s)", style=text_align_style
                                ),
                                generate_input_box(
                                    id="cdot_sigma",
                                    input_type="number",
                                    step=".0001",
                                    value=None,
                                    disabled=True,
                                ),
                            ],
                            width=3,
                        ),
                        dbc.Col(
                            [
                                html.H3(
                                    "Application Type", style=text_align_style
                                ),
                                dbc.RadioItems(
                                    options=[
                                        {"label": "ODTK Runtime", "value": 1},
                                        {"label": "ODTK Desktop", "value": 2},
                                    ],
                                    value=1,
                                    id="app-type",
                                    style=text_align_style,
                                ),
                                html.Br(),
                                html.Br(),
                                html.H3(
                                    "Parallel Thread Count",
                                    style=text_align_style,
                                ),
                                generate_input_box(
                                    id="parallel-thread-count",
                                    input_type="number",
                                    step="1",
                                    value=6,
                                ),
                                html.Br(),
                                html.Br(),
                                html.H3("Perturbations", style=text_align_style),
                                dbc.Checklist(
                                    options=multi_truth_pert,
                                    value=multi_truth_vals,
                                    id="perturbations",
                                    switch=True,
                                    style=text_align_style,
                                ),
                            ],
                            width=3,
                        ),
                    ]
                ),
                dbc.Row(
                    [
                        dbc.Col(
                            [
                                generate_button(
                                    "Load Configuration",
                                    id={"type": "button-tab1", "index": "load-button"},
                                )
                            ],
                            width=2,
                        ),
                        dbc.Col(
                            [
                                generate_button(
                                    "Save Configuration",
                                    id={"type": "button-tab1", "index": "save-button"},
                                )
                            ],
                            width=2,
                        ),
                        dbc.Col(
                            [
                                generate_button(
                                    "Execute Analysis",
                                    id={
                                        "type": "button-tab1",
                                        "index": "execute-button",
                                    },
                                )
                            ],
                            width=2,
                        ),
                    ],
                ),
            ],
        )

        logging_div = html.Div(
            id="big-dumpy",
            children=[
                dbc.Row(
                    [
                        dcc.Textarea(
                            id="log-field",
                            value="Logging Started",
                            style=big_dumpy_style,
                            disabled=True,
                            readOnly=True,
                        )
                    ]
                ),
                dbc.Row(
                    [
                        dbc.Progress(
                            id="wait-bar",
                            value=0,
                            striped=True,
                            animated=True,
                            style=big_dumpy_progress_style,
                            color="primary",
                            max=100,
                            min=0,
                        )
                    ]
                ),
                dcc.Interval(
                    id="log-timer",
                    interval=1000,  # 1000 milliseconds = 10 seconds
                    n_intervals=0,
                ),
            ],
        )

        run_type_items = [
            {"label": "Single Truth", "value": "SINGLE_TRUTH"},
            {"label": "Multi Truth", "value": "MULTI_TRUTH"},
        ]

        run_type = dbc.Row(
            [
                dbc.Col(
                    [
                        dbc.Select(
                            id="run-type",
                            options=run_type_items,
                            value="MULTI_TRUTH",
                            style=dropdown_style,
                        )
                    ]
                )
            ]
        )

        od_scenario_selector = dbc.Row(
            [
                dbc.Col(
                    [
                        generate_path_box(
                            id="scenario-path",
                            placeholder="Path to odtk scenario (*.sco)",
                            input_type="text",
                            disabled=True,
                        )
                    ],
                    width=10,
                ),
                dbc.Col(
                    [
                        generate_button(
                            "Select scenario...",
                            id={
                                "type": "button-tab1",
                                "index": "select-scenario-button",
                            },
                        )
                    ],
                    width=2,
                ),
            ]
        )

        output_selector = dbc.Row(
            [
                dbc.Col(
                    [
                        generate_path_box(
                            id="output-path",
                            placeholder="Path to output",
                            input_type="text",
                            disabled=True,
                        )
                    ],
                    width=10,
                ),
                dbc.Col(
                    [
                        generate_button(
                            "Select output path...",
                            id={"type": "button-tab1", "index": "select-output-button"},
                        )
                    ],
                    width=2,
                ),
            ]
        )

        run_type_div = html.Div(
            id="run_type", children=[run_type],
        )

        od_scenario_div = html.Div(
            id="od_scenario_selector",
            children=[od_scenario_selector],
        )

        output_selector_div = html.Div(
            id="output_selector", children=[output_selector],
        )

        tabs = html.Div(
            children=[
                dbc.Tabs(
                    [
                        dbc.Tab(label="Configuration", tab_id="tab_configuration"),
                        dbc.Tab(label="Logging", tab_id="tab_logging"),
                        dbc.Tab(label="Analysis", tab_id="tab_analysis"),
                    ],
                    id="tabs",
                    active_tab="tab_configuration",
                ),
                html.Div(id="content"),
            ],
        )

        json_selection = html.Div(
            children=[
                dbc.Row(
                    [
                        dbc.Col(
                            [
                                generate_path_box(
                                    id="json-path",
                                    placeholder="Path to run directory",
                                    input_type="text",
                                    disabled=True,
                                )
                            ],
                            width=11,
                        ),
                        dbc.Col(
                            [
                                generate_button(
                                    "Select run...",
                                    id={
                                        "type": "button-tab3",
                                        "index": "select-json-button",
                                    },
                                )
                            ],
                            width=1,
                        ),
                    ]
                ),
                dcc.Textarea(
                    id="run-meta",
                    value="Run Metadata",
                    style=run_metadata_style,
                    disabled=True,
                    readOnly=True,
                ),
            ],
        )

        # Pre-defined to go into analysis_area row
        plot_tabs = html.Div(
            children=[
                dbc.Tabs(
                    [
                        dbc.Tab(label="Position Delta", tab_id="position_plot"),
                        dbc.Tab(label="Mahalanobis Distance",tab_id="mahalanobis_distance_plot"),
                        dbc.Tab(label="Filter Predict Covariance", tab_id="mean_cov_fil_pred"),
                        dbc.Tab(label="Filter Fit Covariance", tab_id="mean_cov_fil_fit"),
                        dbc.Tab(label="Smoother Fit Covariance", tab_id="mean_cov_smo_fit"),
                        dbc.Tab(label="Filter Predict CDF", tab_id="fil_pred_cdf")

                    ],
                    id="plot_tabs",
                    active_tab="position_plot",
                ),
                html.Div(id="plot_content", style=self.plot_style),
            ],
        )

        # Pre-defined to go into analysis_area row
        trial_meta = html.Div(
            style=trial_metadata_style,
            children=[
                dbc.Select(
                    id="trial-select",
                    options=trial_items,
                    value=None,
                    style=dropdown_style,
                    disabled=True,
                ),
                dcc.Textarea(
                    id="trial-meta",
                    value="Trial Metadata",
                    style=trial_metadata_style,
                    disabled=True,
                    readOnly=True,
                ),
            ],
        )

        analysis_area = dbc.Row(
            [
                dbc.Col(
                    [plot_tabs],
                    width=10,
                ),
                dbc.Col(
                    [trial_meta],
                    width=2,
                ),
            ]
        )

        tab_configuration_content = html.Div(
            id="configuration",
            children=[
                run_type_div,
                od_scenario_div,
                output_selector_div,
                runner_params_div,
            ],
            style=universal_tab_style,
        )

        tab_logging_content = html.Div(
            id="logging",
            children=[logging_div],
            style=universal_tab_style,
        )

        tab_analysis_content = html.Div(
            id="plot_tabs_content",
            children=[json_selection, analysis_area],
            style=universal_tab_style,
        )

        self.app.layout = tabs

        @self.app.callback(Output("content", "children"), [Input("tabs", "active_tab")])
        # TODO: reload the values that were on a tab before you switched off of it
        def switch_tab(at):
            if at == "tab_configuration":
                return tab_configuration_content
            elif at == "tab_logging":
                return tab_logging_content
            elif at == "tab_analysis":
                return tab_analysis_content
            return html.P("This shouldn't ever be displayed...")

        @self.app.callback(
            [
                Output("log-field", "value"),
                Output("wait-bar", "value"),
                Output("wait-bar", "label"),
            ],
            Input("log-timer", "n_intervals"),
            State("log-field", "value"),
        )
        def update_log(n_int, log):

            log = "Check saved logs for messages further back in time..."
            if len(self.loglist) > 100:
                mylist = deepcopy(self.loglist[-100:])
            else:
                mylist = deepcopy(self.loglist)
            for entry in mylist:
                log = str(entry) + log
            del mylist

            return (
                log,
                self.percentComplete[0],
                f"{self.percentComplete[0]} %" if self.percentComplete[0] >= 5 else "",
            )

        @self.app.callback(
            [
                Output("json-path", "value"),
                Output("plot_content", "children"),
                Output("run-meta", "value"),
                Output("trial-select", "options"),
                Output("trial-select", "disabled"),
                Output("trial-select", "value"),
            ],
            [
                Input({"type": "button-tab3", "index": ALL}, "n_clicks"),
                Input("plot_tabs", "active_tab"),
            ],
            [
                State("trial-select", "options"),
                State("trial-select", "disabled"),
                State("trial-select", "value"),
            ],
            prevent_initial_call=True,
        )
        def button_tab3_callback(n_clicks, at, trial_options, trial_select_disabled, trial_select_value):
            ctx = callback_context
            if not ctx.triggered:
                button_id = "not.a.button"
            else:
                button_id = ctx.triggered[0]["prop_id"].split(".")[0]

            if button_id == '{"index":"select-json-button","type":"button-tab3"}':
                root = tkinter.Tk()
                root.withdraw()
                root.overrideredirect(True)
                root.geometry("0x0+0+0")
                root.deiconify()
                root.lift()
                root.focus_force()
                root.wm_attributes('-topmost', 1)
                json_path = filedialog.askdirectory(
                    initialdir=os.getcwd(),
                    parent=root,
                )
                if json_path is not None:
                    self.analysis_meta = self.load_run(Path(json_path))
                    self.analysis_path = json_path

                    plots_to_load = ["position_error", "mahalanobis_distance",
                                    "mean_cov_fil_pred", "mean_cov_fil_fit", "mean_cov_smo_fit",
                                    "fil_pred_cdf"]

                    for plot in plots_to_load:
                        self.load_plot(plot)

                    root.destroy()
                    self.analysis_meta["runType"] = str(self.analysis_meta["runType"])

                    # Gather draws
                    # TODO: Bug need to handle multi truth here
                    if self.analysis_meta["runType"] == str(runtbx.RunType.SINGLE_TRUTH):
                        divDict = dptbx.getDivergedDict(Path(json_path))
                        self.trialDict = dptbx.getDrawDf(Path(json_path))
                        self.trialDict.loc['Status'] = [value for key, value in divDict.items()]
                        trial_names = list(self.trialDict.columns)
                        trial_options = [
                            {"label": trial_names[i], "value": i + 1}
                            for i in range(len(trial_names))
                        ]
                        trial_select_disabled = False
                        trial_select_value = 1

                    elif self.analysis_meta["runType"] == str(runtbx.RunType.MULTI_TRUTH):
                        self.trialDict = pd.DataFrame()
                        trial_options = {"label": None, "value": 0}
                        trial_select_disabled = True
                        trial_select_value = 0

            meta_data_value = json.dumps(self.analysis_meta, indent=4)
            if at == "position_plot":
                if (
                    self.analysis_meta is not None
                    and self.positionErrorPlot is not None
                ):
                    figure = self.positionErrorPlot
                else:
                    figure = None
            elif at == "mahalanobis_distance_plot":
                if (
                    self.analysis_meta is not None
                    and self.mahalanobisSmootherFullPlot is not None
                    and self.mahalanobisFilPredCDFPlot is not None
                ):
                    figure = [self.mahalanobisSmootherFullPlot,self.mahalanobisFilPredCDFPlot]
                else:
                    figure = None
            elif at == "mean_cov_fil_pred":
                if (
                    self.analysis_meta is not None
                    and self.meanCovFilPredPlot is not None
                    and self.meanNumCovFilPredPlot is not None
                    and self.meanDeltaCovFilPredPlot is not None
                ):
                    figure = [self.meanCovFilPredPlot,self.meanNumCovFilPredPlot,self.meanDeltaCovFilPredPlot]
                else:
                    figure = None
            elif at == "mean_cov_fil_fit":
                if (
                    self.analysis_meta is not None
                    and self.meanCovFilFitPlot is not None
                    and self.meanNumCovFilFitPlot is not None
                    and self.meanDeltaCovFilFitPlot is not None
                ):
                    figure = [self.meanCovFilFitPlot, self.meanNumCovFilFitPlot, self.meanDeltaCovFilFitPlot]
                else:
                    figure = None
            elif at == "mean_cov_smo_fit":
                if (
                    self.analysis_meta is not None
                    and self.meanCovSmoFitPlot is not None
                    and self.meanNumCovSmoFitPlot is not None
                    and self.meanDeltaCovSmoFitPlot is not None
                ):
                    figure = [self.meanCovSmoFitPlot, self.meanNumCovSmoFitPlot, self.meanDeltaCovSmoFitPlot]
                else:
                    figure = None
            elif at == "fil_pred_cdf":
                if (
                    self.analysis_meta is not None
                    and self.filPredCdfPos is not None
                    and self.filPredCdfVel is not None
                ):
                    figure = [self.filPredCdfPos, self.filPredCdfVel]
                else:
                    figure = None                

            return (
                Path(self.analysis_path).as_posix(),
                figure,
                meta_data_value,
                trial_options,
                trial_select_disabled,
                trial_select_value,
            )

        @self.app.callback(
            [
                Output("run-type", "value"),
                Output("run-name", "value"),
                Output("sat-name", "value"),
                Output("num-trials", "value"),
                Output("num-ods", "value"),
                Output("revs-per-od", "value"),
                Output("conv-revs", "value"),
                Output("pred-revs", "value"),
                Output("scenario-path", "value"),
                Output("output-path", "value"),
                Output("sat-name", "options"),
                Output("sat-name", "disabled"),
                Output("parallel-thread-count", "value"),
                Output("perturbations", "value", allow_duplicate=True),
            ],
            Input({"type": "button-tab1", "index": ALL}, "n_clicks"),
            [
                State("run-type", "value"),
                State("run-name", "value"),
                State("sat-name", "value"),
                State("num-trials", "value"),
                State("num-ods", "value"),
                State("revs-per-od", "value"),
                State("conv-revs", "value"),
                State("pred-revs", "value"),
                State("scenario-path", "value"),
                State("output-path", "value"),
                State("app-type", "value"),
                State("epoch", "value"),
                State("semi-major_axis", "value"),
                State("eccentricity", "value"),
                State("true_arg_of_lat", "value"),
                State("inclination", "value"),
                State("raan", "value"),
                State("argofperigee", "value"),
                State("r_sigma", "value"),
                State("i_sigma", "value"),
                State("c_sigma", "value"),
                State("rdot_sigma", "value"),
                State("idot_sigma", "value"),
                State("cdot_sigma", "value"),
                State("sat-name", "disabled"),
                State("parallel-thread-count", "value"),
                State("perturbations", "value"),
            ],
            prevent_initial_call=True,
            # running = [
            #     (Output('{"index":"execute-button","type":"button-tab1"}', "disabled"), True, False),
            #     (Output('{"index":"execute-button","type":"button-tab1"}', "style"), {"color": "#808080"}, {"color": "#FF0000"}),
            # ]
        )
        def button_tab1_callback(
            n_clicks,
            run_type,
            run_name,
            sat_name,
            num_trials,
            num_ods,
            revs_per_od,
            conv_revs,
            pred_revs,
            scenario_path,
            output_path,
            app_type,
            epoch,
            semi_major_axis,
            eccentricity,
            true_arg_of_lat,
            inclination,
            raan,
            argument_of_perigee,
            r_sigma,
            i_sigma,
            c_sigma,
            rdot_sigma,
            idot_sigma,
            cdot_sigma,
            sat_select_disabled,
            parallel_thread_count,
            perturbations,
        ):
            ctx = callback_context
            if not ctx.triggered:
                button_id = "not.a.button"
            else:
                button_id = ctx.triggered[0]["prop_id"].split(".")[0]

            if button_id == '{"index":"select-scenario-button","type":"button-tab1"}':
                root = tkinter.Tk()
                root.withdraw()
                root.overrideredirect(True)
                root.geometry("0x0+0+0")
                root.deiconify()
                root.lift()
                root.focus_force()
                root.wm_attributes('-topmost', 1)
                scenario_path = filedialog.askopenfilename(
                    defaultextension=".sco",
                    initialdir=os.getcwd(),
                    filetypes=[("ODTK Scenario", "*.sco")],
                    parent=root,

                )
                scenario_path = scenario_path
                root.destroy()

                ### TODO Add some wait indicator
                if scenario_path is not None:
                    load_od_thread = threading.Thread(
                        target=self.load_odtk, args=(app_type, scenario_path, 9393)
                    )
                    load_od_thread.start()
                    load_od_thread.join()
                    sat_select_disabled = False

            if button_id == '{"index":"select-output-button","type":"button-tab1"}':
                root = tkinter.Tk()
                root.withdraw()
                root.overrideredirect(True)
                root.geometry("0x0+0+0")
                root.deiconify()
                root.lift()
                root.focus_force()
                root.wm_attributes('-topmost', 1)
                output_path = filedialog.askdirectory(
                    initialdir=os.getcwd(),
                    parent=root,
                )
                output_path = Path(output_path).as_posix()
                root.destroy()

            if button_id == '{"index":"save-button","type":"button-tab1"}':
                save_content(
                    run_type,
                    run_name,
                    sat_name,
                    num_trials,
                    num_ods,
                    revs_per_od,
                    conv_revs,
                    pred_revs,
                    scenario_path,
                    output_path,
                    app_type,
                    epoch,
                    semi_major_axis,
                    eccentricity,
                    true_arg_of_lat,
                    inclination,
                    raan,
                    argument_of_perigee,
                    r_sigma,
                    i_sigma,
                    c_sigma,
                    rdot_sigma,
                    idot_sigma,
                    cdot_sigma,
                    parallel_thread_count,
                    perturbations,
                )
            if button_id == '{"index":"load-button","type":"button-tab1"}':
                root = tkinter.Tk()
                root.withdraw()
                root.lift()
                root.wm_attributes('-topmost', 1)
                json_file = filedialog.askopenfile(filetypes=[("JSON", "*.json")])

                if json_file is None:
                    return

                content = json.load(json_file)
                run_type = content["run_type"]
                run_name = content["run_name"]
                num_trials = content["num_trials"]
                num_ods = content["num_ods"]
                revs_per_od = content["revs_per_od"]
                conv_revs = content["conv_revs"]
                pred_revs = content["pred_revs"]
                scenario_path = content["scenario_path"]
                output_path = content["output_path"]
                app_type = content["app_type"]
                epoch = content["epoch"]
                semi_major_axis = content["semi-major_axis"]
                eccentricity = content["eccentricity"]
                true_arg_of_lat = content["true_arg_of_lat"]
                inclination = content["inclination"]
                raan = content["raan"]
                argument_of_perigee = content["argofperigee"]
                r_sigma = content["r_sigma"]
                i_sigma = content["i_sigma"]
                c_sigma = content["c_sigma"]
                rdot_sigma = content["rdot_sigma"]
                idot_sigma = content["idot_sigma"]
                cdot_sigma = content["cdot_sigma"]
                parallel_thread_count = content["parallel_thread_count"]
                perturbations = content["perturbations"]

                if scenario_path is not None:
                    scenario_path = scenario_path

                load_od_thread = threading.Thread(
                    target=self.load_odtk, args=(app_type, scenario_path, 9393)
                )
                load_od_thread.start()
                load_od_thread.join()

                sat_name = content["sat_name"]
                sat_select_disabled = False

                root.destroy()

            if button_id == '{"index":"execute-button","type":"button-tab1"}':

                if run_type == "SINGLE_TRUTH" or run_type == "Single Truth":
                    run_type_enum = runtbx.RunType.SINGLE_TRUTH
                if run_type == "MULTI_TRUTH" or run_type == "Multi Truth":
                    run_type_enum = runtbx.RunType.MULTI_TRUTH

                dmtbx.initRunDirectory(run_name, num_trials, output_path, True)
                save_content(
                    run_type,
                    run_name,
                    sat_name,
                    num_trials,
                    num_ods,
                    revs_per_od,
                    conv_revs,
                    pred_revs,
                    scenario_path,
                    output_path,
                    app_type,
                    epoch,
                    semi_major_axis,
                    eccentricity,
                    true_arg_of_lat,
                    inclination,
                    raan,
                    argument_of_perigee,
                    r_sigma,
                    i_sigma,
                    c_sigma,
                    rdot_sigma,
                    idot_sigma,
                    cdot_sigma,
                    parallel_thread_count,
                    perturbations,
                )

                runLog = logging.getLogger(run_name)
                runLog.setLevel(logging.INFO)
                run_log_file = str(Path(output_path) / run_name / "runlog.txt")
                handler = logging.FileHandler(run_log_file)
                formatter = logging.Formatter("%(asctime)s %(threadName)s %(levelname)-4s %(message)s")
                handler.setFormatter(formatter)
                runLog.addHandler(handler)

                logtbx.log(runLog, "Creating dictionaries")

                metaDict = {
                    "templateSatName": sat_name,
                    "runName": run_name,
                    "runType": run_type_enum,
                    "outputPath": output_path,
                    "overwritePreviousRun": True,
                    "perturbations": perturbations,
                }

                inputDict = {
                    "numTrials": num_trials,
                    "numOdPerTrial": num_ods,
                    "numRevsPerOd": revs_per_od,
                    "numConvergenceRevs": conv_revs,
                    "numRevsPerPredict": pred_revs,
                    "timeStepMin": 1,
                }

                logtbx.log(runLog, "Created dictionaries")
                logtbx.log(runLog, f"Metadata: {metaDict}")
                logtbx.log(runLog, f"Inputs: {inputDict}")

                if self.scenario == None:
                    scenario_path = scenario_path

                num_threads = 1  # should always be set to 1 otherwise the Intel MKL libraries will fight each other

                parallel_thread_count_usable = min(num_trials, multiprocessing.cpu_count(), parallel_thread_count)
                parallel_thread_count = parallel_thread_count_usable

                logtbx.log(
                    runLog, f"Opening {parallel_thread_count} ODTK instances"
                )
                start_time = time.time()
                self.odtk_instances = []
                self.scenarios = []
                load_od_threads = []
                for i in range(0, parallel_thread_count):
                    load_od_threads.append(threading.Thread(
                        target=self.load_odtk,
                        args=(app_type, scenario_path, 9393 + i),
                    ))
                for thread in load_od_threads:
                    thread.start()
                for thread in load_od_threads:
                    thread.join()
                end_time = time.time()

                logtbx.log(
                    runLog,
                    f"Opened {parallel_thread_count} ODTK instances in {end_time-start_time} seconds"
                )

                self.initState = [
                    epoch,
                    semi_major_axis,
                    eccentricity,
                    true_arg_of_lat,
                    inclination,
                    raan,
                    argument_of_perigee,
                ]
                self.initUnc = [
                    r_sigma,
                    i_sigma,
                    c_sigma,
                    rdot_sigma,
                    idot_sigma,
                    cdot_sigma,
                ]

                logtbx.log(runLog, f"Initial State: {self.initState}")
                logtbx.log(runLog, f"Initial Uncertainty: {self.initUnc}")

                for j in range(parallel_thread_count):
                    odtk = self.odtk_instances[j].odtk
                    odtk.RuntimeSettings.NumberOfThreads.Assign(num_threads)
                    new_scenario_name = (
                        odtk.scenario[0].name.Value.eval() + str(j) + ".sco"
                    )
                    new_scenario_path = str(
                        Path(output_path) / run_name / new_scenario_name
                    )
                    odtk.SaveObj(odtk.scenario[0], new_scenario_path, True)
                    scenario = odtk.scenario[0]

                    satellite = runtbx.satelliteTemplateSelection(
                        scenario,
                        sat_name,
                        None,
                        self.loglist,
                        self.initState,
                        self.initUnc,
                    )
                self.scenario = self.scenarios[0]
                metaDict["scenarioStart"] = (
                    self.scenario.DefaultTimes.Processes.StartTime.Format("UTCG")
                )

                # Pull semi-major axis of satellite from ODTK and convert to meters
                keplerian = satellite.OrbitState.ToKeplerian()
                semi_major_axis = keplerian.SemiMajorAxis.GetIn("m")

                # Compute satellite orbit period, this will inform fit span for each OD
                period_sec = 2 * np.pi * semi_major_axis ** (3 / 2) / np.sqrt(GM_earth)
                period_min = period_sec.value / 60

                # Compute convergence duration, fit span duration, and predict duration
                conv_duration = round(period_min * conv_revs, 0)
                fit_duration = round(period_min * revs_per_od, 0)
                pred_duration = round(period_min * pred_revs, 0)

                # Add durations to meta dict
                metaDict["conv_dur_sec"] = conv_duration * 60
                metaDict["fit_dur_sec"] = fit_duration * 60
                metaDict["pred_dur_sec"] = pred_duration * 60

                # Save off pickle files
                logtbx.createMetaDictFile(metaDict, Path(output_path) / run_name)
                logtbx.createInputDictFile(inputDict, Path(output_path) / run_name)

                # Run monte carlo based on input runtype
                logtbx.log(
                    runLog, f"Beginning Run {run_name} with Type {run_type}"
                )

                start = time.time()
                mc_run = runtbx.MCRun(
                    scenario=self.scenarios,
                    inputDict=inputDict,
                    metaDict=metaDict,
                    conv_duration=conv_duration,
                    pred_duration=pred_duration,
                    fit_duration=fit_duration,
                    loglist=self.loglist,
                    percentComplete=self.percentComplete,
                    initState=self.initState,
                    initUnc=self.initUnc,
                    deleteEphem=False,
                )
                mc_run.run()
                end = time.time()

                logtbx.log(
                    runLog,
                    f"Finished Run {run_name} with Type {run_type} in "
                    f"{(end-start)/60:.2f} minutes",
                    self.loglist,
                )

                for application in self.odtk_instances:
                    application.close()

            return (
                run_type,
                run_name,
                sat_name,
                num_trials,
                num_ods,
                revs_per_od,
                conv_revs,
                pred_revs,
                scenario_path,
                output_path,
                self.satellites,
                sat_select_disabled,
                parallel_thread_count,
                perturbations,
            )


        @self.app.callback(
                [
                    Output("perturbations", "options"),
                    Output("perturbations", "value", allow_duplicate=True)
                ],
                Input("run-type", "value"),
                [
                State("perturbations", "value"),
                State("perturbations", "options"),
                ],
                prevent_initial_call=True,
        )
        def run_type_state_callback(run_type, perturbations, pert_options):
            if run_type == "SINGLE_TRUTH" or run_type == "Single Truth":
                if pert_options == single_truth_pert:
                    return(pert_options, perturbations)
                else:
                    return(single_truth_pert, single_truth_vals)
            if run_type == "MULTI_TRUTH" or run_type == "Multi Truth":
                if pert_options == multi_truth_pert:
                    return(pert_options, perturbations)
                else:
                    return(multi_truth_pert, multi_truth_vals)


        @self.app.callback(
            [
                Output("epoch", "value"),
                Output("semi-major_axis", "value"),
                Output("eccentricity", "value"),
                Output("true_arg_of_lat", "value"),
                Output("inclination", "value"),
                Output("raan", "value"),
                Output("argofperigee", "value"),
                Output("r_sigma", "value"),
                Output("i_sigma", "value"),
                Output("c_sigma", "value"),
                Output("rdot_sigma", "value"),
                Output("idot_sigma", "value"),
                Output("cdot_sigma", "value"),
                Output("epoch", "disabled"),
                Output("semi-major_axis", "disabled"),
                Output("eccentricity", "disabled"),
                Output("true_arg_of_lat", "disabled"),
                Output("inclination", "disabled"),
                Output("raan", "disabled"),
                Output("argofperigee", "disabled"),
                Output("r_sigma", "disabled"),
                Output("i_sigma", "disabled"),
                Output("c_sigma", "disabled"),
                Output("rdot_sigma", "disabled"),
                Output("idot_sigma", "disabled"),
                Output("cdot_sigma", "disabled"),
            ],
            [
                Input("sat-name", "value"),
            ],
            [
                State("epoch", "value"),
                State("semi-major_axis", "value"),
                State("eccentricity", "value"),
                State("true_arg_of_lat", "value"),
                State("inclination", "value"),
                State("raan", "value"),
                State("argofperigee", "value"),
                State("r_sigma", "value"),
                State("i_sigma", "value"),
                State("c_sigma", "value"),
                State("rdot_sigma", "value"),
                State("idot_sigma", "value"),
                State("cdot_sigma", "value"),
            ],
            prevent_initial_call=True,
        )
        def satellite_state_callback(
            sat_name,
            epoch_state,
            sma_state,
            ecc_state,
            true_lat_state,
            inc_state,
            raan_state,
            argofper_state,
            rsig_state,
            isig_state,
            csig_state,
            rdot_state,
            idot_state,
            cdot_state,
        ):
            if (self.scenario == None) or (sat_name == None):
                return (
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    None,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                    True,
                )

            satState = self.scenario.Satellite[sat_name].OrbitState.ToKeplerian()
            if satState is not None:
                epoch = satState.Epoch.Format("UTCG")
                sma = "%.4f" % (satState.SemiMajorAxis.GetIn("km"))
                ecc = "%.4f" % (satState.Eccentricity.Value.eval())
                true_lat = "%.4f" % (satState.TrueArgofLatitude.GetIn("deg"))
                inc = "%.4f" % (satState.Inclination.GetIn("deg"))
                raan = "%.4f" % (satState.RAAN.GetIn("deg"))
                argofper = "%.4f" % (satState.ArgofPerigee.GetIn("deg"))
                satUnc = self.scenario.Satellite[sat_name].OrbitUncertainty
                rsig = "%.4f" % (satUnc.R_sigma.GetIn("m"))
                isig = "%.4f" % (satUnc.I_sigma.GetIn("m"))
                csig = "%.4f" % (satUnc.C_sigma.GetIn("m"))
                rdot = "%.4f" % (satUnc.Rdot_sigma.GetIn("m/sec"))
                idot = "%.4f" % (satUnc.Idot_sigma.GetIn("m/sec"))
                cdot = "%.4f" % (satUnc.Cdot_sigma.GetIn("m/sec"))
            else:
                epoch = epoch_state
                sma = sma_state
                ecc = ecc_state
                true_lat = true_lat_state
                inc = inc_state
                raan = raan_state
                argofper = argofper_state
                rsig = rsig_state
                isig = isig_state
                csig = csig_state
                rdot = rdot_state
                idot = idot_state
                cdot = cdot_state

            return (
                epoch,
                sma,
                ecc,
                true_lat,
                inc,
                raan,
                argofper,
                rsig,
                isig,
                csig,
                rdot,
                idot,
                cdot,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
                False,
            )

        @self.app.callback(
            [
                Output("trial-meta", "value"),
            ],
            [
                Input("trial-select", "value"),
            ],
            [State("trial-meta", "value")],
        )
        def trial_select_callback(
            trial_selection,
            trial_metadata,
        ):
            if not self.trialDict.empty and trial_selection is not None:
                trial_metadata = self.trialDict[f"Trial {trial_selection}"].to_json(indent=4)

            return (trial_metadata,)

    def load_plot(self, plot_name: str):

        loaded_directory = Path(self.analysis_meta["loadedDir"])
        plot_directory = loaded_directory / "Post_Processing" / "Plots"
        plot_height = self.plot_style["height"]

        plotly.io.json.config.default_engine = 'orjson'

        engine = "orjson"

        if plot_name == "position_error":
            figure_pos = plotly.io.read_json(str(plot_directory / "position_error.json"), engine=engine)
            figure_pos.update_layout(height=plot_height)
            self.positionErrorPlot = dcc.Graph(figure=figure_pos)

        elif plot_name == "mahalanobis_distance":
            figure_mah = plotly.io.read_json(str(plot_directory / "mahalanobis_distance.json"), engine=engine)
            figure_mah.update_layout(height=plot_height)
            self.mahalanobisSmootherFullPlot = dcc.Graph(figure=figure_mah)
            figure_mahfilpred = plotly.io.read_json(str(plot_directory / "mahal_filpred_cdf.json"), engine=engine)
            figure_mahfilpred.update_layout(height=plot_height)
            self.mahalanobisFilPredCDFPlot = dcc.Graph(figure=figure_mahfilpred)

        elif plot_name == "mean_cov_fil_pred":
            figure_cov = plotly.io.read_json(str(plot_directory / "mean_cov_fil_pred.json"), engine=engine)
            figure_cov.update_layout(height=plot_height)
            self.meanCovFilPredPlot = dcc.Graph(figure=figure_cov)
            figure_cov2 = plotly.io.read_json(str(plot_directory / "mean_cov_fil_pred_num.json"), engine=engine)
            figure_cov2.update_layout(height=plot_height)
            self.meanNumCovFilPredPlot = dcc.Graph(figure=figure_cov2)
            figure_cov3 = plotly.io.read_json(str(plot_directory / "mean_cov_fil_pred_delta.json"), engine=engine)
            figure_cov3.update_layout(height=plot_height)
            self.meanDeltaCovFilPredPlot = dcc.Graph(figure=figure_cov3)

        elif plot_name == "mean_cov_fil_fit":
            figure_cov = plotly.io.read_json(str(plot_directory / "mean_cov_fil_fit.json"), engine=engine)
            figure_cov.update_layout(height=plot_height)
            self.meanCovFilFitPlot = dcc.Graph(figure=figure_cov)
            figure_cov2 = plotly.io.read_json(str(plot_directory / "mean_cov_fil_fit_num.json"), engine=engine)
            figure_cov2.update_layout(height=plot_height)
            self.meanNumCovFilFitPlot = dcc.Graph(figure=figure_cov2)
            figure_cov3 = plotly.io.read_json(str(plot_directory / "mean_cov_fil_fit_delta.json"), engine=engine)
            figure_cov3.update_layout(height=plot_height)
            self.meanDeltaCovFilFitPlot = dcc.Graph(figure=figure_cov3)

        elif plot_name == "mean_cov_smo_fit":
            figure_cov = plotly.io.read_json(str(plot_directory / "mean_cov_smo_fit.json"), engine=engine)
            figure_cov.update_layout(height=plot_height)
            self.meanCovSmoFitPlot = dcc.Graph(figure=figure_cov)
            figure_cov2 = plotly.io.read_json(str(plot_directory / "mean_cov_smo_fit_num.json"), engine=engine)
            figure_cov2.update_layout(height=plot_height)
            self.meanNumCovSmoFitPlot = dcc.Graph(figure=figure_cov2)
            figure_cov3 = plotly.io.read_json(str(plot_directory / "mean_cov_smo_fit_delta.json"), engine=engine)
            figure_cov3.update_layout(height=plot_height)
            self.meanDeltaCovSmoFitPlot = dcc.Graph(figure=figure_cov3)

        elif plot_name == "fil_pred_cdf":
            figure_pos = plotly.io.read_json(str(plot_directory / "fil_pred_cdf_pos.json"), engine=engine)
            figure_pos.update_layout(height=plot_height)
            self.filPredCdfPos = dcc.Graph(figure=figure_pos)
            figure_vel = plotly.io.read_json(str(plot_directory / "fil_pred_cdf_vel.json"), engine=engine)
            figure_vel.update_layout(height=plot_height)
            self.filPredCdfVel = dcc.Graph(figure=figure_vel)

        elif plot_name == "pdf":
            return

    def load_run(self, run_path: str):
        metaDict = logtbx.getMetaDictionary(run_path)
        metaDict["loadedDir"] = str(run_path)
        return metaDict

    def load_odtk(self, app_type: int, scenario_path: str, port: int):
        # Convert app type int into useable od application type
        if app_type == 1:
            od_app_type = OdtkType.Runtime
        elif app_type == 2:
            od_app_type = OdtkType.Desktop
        else:
            od_app_type = OdtkType.Runtime

        # Open ODTK instance if not already open
        if (self.scenario == None) or (self.odtk == None):
            scenario_path = str(Path(scenario_path))


        odtk_instance = runtbx.openODTKScenario(
            scenario_path,
            address="127.0.0.1",
            port=port,
            application_type=od_app_type,
            be_quiet=True,
        )

        logger.debug(odtk_instance)
        self.odtk_instances.append(odtk_instance)

        self.odtk = []
        self.satellites = []

        odtk = odtk_instance.odtk
        scenario = odtk.scenario[0]

        self.odtk.append(odtk)
        self.scenarios.append(scenario)

        self.scenario = scenario
        # Generate satellite list of available sats in scenario
        for i in range(0, scenario.Satellite.Count):
            self.satellites.append(
                {
                    "label": scenario.Satellite[i].Name.Value.eval(),
                    "value": scenario.Satellite[i].Name.Value.eval(),
                }
            )

    def run(self, debug):
        self.app.run_server(debug=debug)

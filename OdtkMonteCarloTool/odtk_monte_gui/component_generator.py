import dash_bootstrap_components as dbc
from dash import dcc, html


def generate_label(label_text: str) -> html.P:
    """generates a consistent html paragraph label

    Args:
        label_text (str): name to act as the label

    Returns:
        html.P: a consistent html paragraph label
    """
    return html.P(
        label_text,
    )


def generate_input_box(
    id: str,
    input_type: str,
    placeholder: str = "",
    disabled: bool = False,
    value: float = 0,
    step: str = "any",
) -> dcc.Input:
    """generates a consistent dash input

    Args:
        id (str): the id for the input component
        placeholder (str): grayed out value for the input
        input_type (str): type of input value
        value (float): default value for the input
        step (str): The string defining step size for arrow increments

    Returns:
        dcc.Input: a consistent dash input
    """

    return dbc.Input(
        id=id,
        placeholder=placeholder,
        type=input_type,
        disabled=disabled,
        debounce=True,
        style={"margin": 10, "margin-left": 0, "width": "75%"},
        step=step,
        value=value,
    )


def generate_button(content: str, id: str, direction: str = "left") -> dbc.Button:
    """generates a consistent dash button

    Args:
        content (str): the string text for a button
        id (str): the id for the button component
        direction (str, optional): direction to align the element. Defaults to "left".

    Returns:
        dbc.Button: a consistent dash button
    """
    return dbc.Button(
        content,
        id=id,
        n_clicks=0,
        style={
            "display": "inline-block",
            "margin": 10,
            "justify": direction,
            "align": direction,
        },
    )


def generate_path_box(
    id: str, placeholder: str, input_type: str, disabled: bool = False, value: str = ""
) -> dcc.Input:
    """generates a consistent dash Input box for file/folder paths

    Args:
        id (str): the id for the input box
        placeholder (str): the hint text to show
        input_type (str): the type of input i.e. "text" or "number"
        disabled (bool, optional): if the user can edit or not. Defaults to False.
        value (str, optional): the default value in the box. Defaults to "".

    Returns:
        dcc.Input: a consistent dash Input box for a Path
    """
    return dbc.Input(
        id=id,
        placeholder=placeholder,
        type=input_type,
        disabled=disabled,
        debounce=True,
        value="",
        style={"margin": 10, "margin-left": 0},
    )

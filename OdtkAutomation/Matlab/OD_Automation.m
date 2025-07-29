%% Initialize ODTK Scenario

clear all; close all; clc;

% Start ODTK application with the HTTP server started (default port is 9393)and pause 20 seconds
!"C:\Program Files\AGI\ODTK 7\bin\AgUiApplication.exe" /pers ODTK /enablehttpserver /httpserverport 9393 /httpserveraddress 127.0.0.1 &
pause(20);

% Add the ODTK API library in the search path
addpath('C:\Program Files\AGI\ODTK 7\CodeSamples\CrossPlatform\ODTK\matlab\lib');

% The following initializes the client to connect to ODTK at the default port
client = Client();
odtk = client.Root;
scen = odtk.application.createObj(odtk, "Scenario", "OD_Automation");

%% Add Measurements
meas_files = scen.Measurements.Files;
new_elem = meas_files.NewElem();
new_elem.Enabled = 1;
new_elem.FileName = 'C:\Program Files\AGI\ODTK 7\ODTK\UserData\TrackingData\LEO_Tracking.gobs';
unused = meas_files.push_back(new_elem);
scen.Measurements.PreviewTrackingData();
%% Add Tracking Stations
tso = odtk.LoadObject(scen.Name,'C:\Program Files\AGI\ODTK 7\ODTK\UserData\TrackingStations\ESTRACK.tso');

%% Create a satellite object
sat = odtk.CreateObj(scen, "Satellite", "LEO_Sat");
initState = odtk.Application.InitialStateTool("TLE","C:\Program Files\AGI\ODTK 7\ODTK\UserData\Ephemeris\Sentinel-1A.tce","GEN", "/ssc 39634");

% Define an initial epoch to use and update the state:
update = sat.ReferenceTrajectory.UpdateInitialConditions(initState.TLEOutput,"14 Mar 2017 13:28:36.292 UTCG", "",false,false,false);

%% Add Filter
filterObj = odtk.CreateObj(scen, "Filter", "LEO_Filter");

% Generate smoother data
filterObj.Output.SmootherData.Generate = true;

% Run
filterObj.Go();

%% Add Smoother
smoother = odtk.CreateObj(scen, "Smoother", "LEO_Smoother");

% Specify Filter Input
smoother.Input.Filename = filterObj.Output.SmootherData.Filename;

% Generate diff file
smoother.Output.FilterDifferencingControls.Generate = true;

% Run
smoother.Go();

%% Build Plot Styles (Residual Ratios, Smoother Position Uncertainty, Position Consistency
% Clear Data Product List
odtk.ProductBuilder.DataProducts.Clear();
 
%%% Residual Ratios %%%

newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.Push_Back(newElem);
product0 = odtk.ProductBuilder.DataProducts{0};
product0.Name = "Measurements";
% Define contents of the data product using pre-existing files
product0.Outputs.Style = append(odtk.InstallHome,"\ODTK\AppData\Styles\Static\Measurements.pyrpt");
product0.Outputs.Export.Enabled = true;
product0.Outputs.Export.Format = "TXT";
product0.Outputs.Export.FileName = "C:\temp\measurements.txt";

% Create New Product
newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.Push_Back(newElem);
product0 = odtk.ProductBuilder.DataProducts{0};
product0.Name = "Residual Ratios";
% Add Input as filrun file from filter
newSrc = product0.Inputs.DataSources.NewElem();
product0.Inputs.DataSources.push_back(newSrc);
product0.Inputs.DataSources{0}.Filename = filterObj.Output.DataArchive.Filename.value;
% Define contents of the data product using pre-existing files
product0.Outputs.Style = append(odtk.InstallHome,"\ODTK\AppData\Styles\Static\Residual Ratios.gph");

%%% Smoother Position Uncertainty %%%
% Create New Product
newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.Push_Back(newElem);
product1 = odtk.ProductBuilder.DataProducts{1};
product1.Name = "Smoother Position Uncertainty";
% Add Input as filrun file from filter
newSrc = product1.Inputs.DataSources.NewElem();
product1.Inputs.DataSources.push_back(newSrc);
product1.Inputs.DataSources{0}.Filename = smoother.Output.DataArchive.Filename.value;
% Define contents of the data product using pre-existing files
product1.Outputs.Style = append(odtk.InstallHome,"\ODTK\AppData\Styles\Static\Position Uncertainty.gph");

%%% Position Consistency %%%
% Create New Product
newElem = odtk.ProductBuilder.DataProducts.NewElem();
odtk.ProductBuilder.DataProducts.Push_Back(newElem);
product2 = odtk.ProductBuilder.DataProducts{2};
product2.Name = "Position Consistency";
% Add Input as filrun file from filter
newSrc = product2.Inputs.DataSources.NewElem();
product2.Inputs.DataSources.push_back(newSrc);
product2.Inputs.DataSources{0}.Filename = smoother.Output.FilterDifferencingControls.Filename.value;
% Define contents of the data product using pre-existing files
product2.Outputs.Style = append(odtk.InstallHome,"\ODTK\AppData\Styles\Static\Pos Consistency.gph");

%% Generate Plots
odtk.ProductBuilder.GenerateProduct(product0.Name);
odtk.ProductBuilder.GenerateProduct(product1.Name);
odtk.ProductBuilder.GenerateProduct(product2.Name);

%% How to Save Off PNGs
product0.Outputs.Export.Enabled = true;
product0.Outputs.Export.Format = "PNG";
product0.Outputs.Export.FileName = "C:\temp\residualratios.png";
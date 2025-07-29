% Make sure ODTK is running, with the HTTP server started (default port is 9393) before running this script

% Add the ODTK API library in the search path
addpath('./lib');


% The following initializes the client to connect to ODTK at the default port
client = Client();
odtk = client.Root;


% Notes on accessing attributes:
% - use curly braces to access an item by index (as in: odtk.scenario{0},
%   scenario.Satellite{'mySat'}).
%   Note that ODTK's indexing system is 0-based, note 1-based.

% Starting with the ODTK root object, each object provides access to its sub objects via the 'children' scope.
% Use 'children' to test if there are any objects and then use class name to access them.
odtkChildCount = odtk.children.count;


% Creating, Deleting, Saving, and Loading Objects
% There are a number of functions in ODTK to manage the scenario and other objects.
% New objects are created with the CreateObj function. It takes three parameters: the parent object of the new object,
% the type of object to create, and the name of the new object. This function returns a handle to
% the new object. NOTE: do not give objects ODTK class names ("Scenario", "Satellite", "Filter", etc.).

% ensure new scenario
if odtkChildCount > 0
    % close scenario
    odtk.application.deleteObject("", odtk.scenario{0});
    fprintf("Scenario closed.\n");
end
odtk.application.createObj(odtk, "Scenario", "TestScenario");
fprintf("Scenario created.\n");

% create satellites
zerothSatelliteName = "mySat";
zeroAsSatelliteName = "0";
odtk.application.createObj(odtk.scenario{0}, "Satellite", zerothSatelliteName);
myOtherSat = odtk.application.createObj(odtk.scenario{0}, "Satellite", "myOtherSat");
odtk.application.createObj(odtk.scenario{0}, "Satellite", zeroAsSatelliteName);
fprintf("Satellites created.\n");

% create filter
odtk.application.createObj(odtk.scenario{0}, "Filter", "Filter1");

% You can save the scenario or any object to a file with the SaveObj function.
% It takes three parameters: the object handle, the destination file name,
% and the boolean SaveObjectChildren flag.
[thisFolderPath] = fileparts(mfilename('fullpath'));
scenarioFilePath = [thisFolderPath, filesep, 'Example1.sco'];
odtk.SaveObj(odtk.scenario{0}, scenarioFilePath, true);
fprintf("Scenario saved to %s.\n", scenarioFilePath);

% The DeleteObject function takes an object handle and returns a success
% status.
deleted = odtk.deleteobject(myOtherSat);
fprintf("Deleted myOtherSat: %s\n", string(deleted));

% NOTE: Only one scenario at a time is allowed; unload the current scenario
% before loading the next one.
% To load an object at a later time, use the LoadObject function.
% Its parameters are the path of the parent object where the new object is
% to be loaded and the source file name containing the object to be loaded.

% close the scenario
odtk.application.deleteObject("", odtk.scenario{0});
% load the scenario
scenarioLoaded = odtk.LoadObject("", scenarioFilePath);
fprintf("Scenario loaded from %s: %s\n", scenarioFilePath, string(scenarioLoaded));

% As a side effect of supporting various languages there are multiple ways to get access to the same object.
% For instance, "mySat" could be referred to as:

scenario = odtk.scenario{0};
satellite = scenario.mySat;
fprintf("Satellite name using scenario.mySat: %s\n", satellite.name);
satellite = scenario.Satellite{0};
fprintf("Satellite name using scenario.Satellite{0}: %s\n", satellite.name);
satellite = scenario.Satellite{zerothSatelliteName};
fprintf("Satellite name using scenario.Satellite{""%s""} : %s\n", zerothSatelliteName, satellite.name);
satellite = scenario.Children.Satellite{0};
fprintf("Satellite name using scenario.Children.Satellite{0}: %s\n", satellite.name);
satellite = scenario.Children{"Satellite"}{0};
fprintf("Satellite name using scenario.Children{""Satellite""}{0}: %s\n", satellite.name);
satellite = scenario.Children{"Satellite"}.Item{0};
fprintf("Satellite name using scenario.Children{""Satellite""}.Item{0}: %s\n", satellite.name);
satellite = scenario.Children{"Satellite"}.Item{zerothSatelliteName};
fprintf("Satellite name using scenario.Children{""Satellite""}.Item{%s}: %s\n", zerothSatelliteName, satellite.name);
satellite = scenario.Children{"Satellite"}.ItemByName{zerothSatelliteName};
fprintf("Satellite name using scenario.Children{""Satellite""}.ItemByName{""%s""}: %s\n", zerothSatelliteName, satellite.name);

% To display the names of each of the satellites in your scenario you could use the following:
fprintf("Names of satellites in the scenario:\n")
satellites = odtk.scenario{0}.children{"Satellite"};
for i = 0: satellites.Count-1
    fprintf("  %i. %s\n", i, satellite.name);
end

% Testing To See If An Object Exists
% access by index
satelliteName = satellites{0}.name;
fprintf("satellites{0} name: %s\n", satelliteName);
% access by name
fprintf("satellites{""%1$s""} name: %2$s\n", satelliteName, satellites{satelliteName}.name);
% access using a name that is numeric (string)
satelliteName = satellites{zeroAsSatelliteName}.name;
fprintf("satellites{""%1$s""} name: %2$s\n", zeroAsSatelliteName, satelliteName);
            
try
    % access by invalid index should throw an exception
    satelliteName = satellites{7}.name;
    throw(MException('ScriptingGuide:unexpectedError', 'The expected exception was not thrown.'));
catch ex
    if ex.identifier == ClientExceptionIDs.InvalidAttributePath && contains(ex.message, "Index Out of Range")
        fprintf("Non-existent satellite reference threw an exception as expected.\n");
    else
        throw(MException('ScriptingGuide:unexpectedError', 'An unexpected exception was thrown.'));
    end
end

% ItemExists returns true on existing name
exists = satellites.ItemExists(zerothSatelliteName);
fprintf("satellite ""%1$s"" exists: %2$s\n", zerothSatelliteName, string(exists));

% ItemExists returns false on non-existent name
exists = satellites.ItemExists("07");
fprintf("satellite ""07"" exists: %s\n", string(exists));


% Basic Types
% Most of the ODTK attributes are simple scalar types that have equivalents in many programming
% languages: {REAL, INT, BOOL, STRING, STRING ENUMERATION}.

% Type REAL
% Real attributes are used for unit-less real numbers (min/max constraint may apply).

scenario.OrbitClassifications.LEO.EccentricityMax = 0.15;
eccentricityMax = scenario.OrbitClassifications.LEO.EccentricityMax;
fprintf("Eccentricity max: %f\n", eccentricityMax);

% Type INT
% These attributes are for integer values (min/max constraint may apply).

scenario.Measurements.LookAheadBufferSize = 200;
lookAheadBufferSize = scenario.Measurements.LookAheadBufferSize;
fprintf("Measurements look ahead buffer size: %i\n", lookAheadBufferSize);

% Type BOOL
% Boolean attributes accept values of true and false.

filter1 = scenario.Filter{"Filter1"};
filter1.Output.SmootherData.Generate = true;
generate = filter1.Output.SmootherData.Generate;
fprintf("Generate: %s\n", string(generate));

% Type STRING
% An example of a string is a "Description" field available on all ODTK objects.

scenario.Description = "This is an example ...";
scenarioDescription = scenario.Description;
fprintf("Scenario description: %s\n", scenarioDescription);

% Type STRING ENUMERATION
% This type of STRING attribute can only accept a specific pre-defined set of values. For
% instance, Filter.StartMode can be either "Initial", "Restart", or "AutoRestart".
if filter1.ProcessControl.StartMode == "Initial"
    filter1.ProcessControl.StartMode = "AutoRestart";
end
fprintf("Filter process control start mode: %s\n", filter1.ProcessControl.StartMode);

% Use the "Choices" property to get the list of valid enumeration choices
startModeChoices = filter1.ProcessControl.StartMode.Choices;
fprintf("Start mode choices\n");
for i = 0: startModeChoices.Count-1
    fprintf("  %i. %s\n", i, startModeChoices{i});
end

% One special case of the string enumeration is the SelectedRestartTime for a filter or simulator.
% The choices in this case change based on each filter or simulator run, and the choices contain a list of date/time
% strings with units of UTCG or GPSG. The units are determined by the scenario date units setting
% scenario.Units.DateFormat.
% When setting the SelectedRestartTime in a script, any of the following formats will work; if no units are defined,
% the input date string will be assumed to be in the scenario units. If the restart time that you set is not a valid
% restart time, then the SelectedRestartTime will not be set.

simulator = odtk.application.createObj(scenario, "Simulator", "Simulator1");
trackingSystem = odtk.application.createObj(scenario, "TrackingSystem", "TrackingSystem1");
facility = odtk.application.createObj(trackingSystem, "Facility", "Facility1");

if ~simulator.Go()
    fprintf("Simulator run failed.\n");
    exit();
end
filter1.ProcessControl.StartMode = "Initial";
if ~filter1.Go()
    fprintf("Filter run failed.\n")
    exit();
end

lastSelectedRestartTime = "";
selectedRestartTimesChoices = filter1.ProcessControl.SelectedRestartTime.Choices;
fprintf("Selected restart time choices\n");
for i = 0: selectedRestartTimesChoices.Count-1
    lastSelectedRestartTime = selectedRestartTimesChoices{i};
    fprintf("   %i. %s\n", i, lastSelectedRestartTime);
end

fprintf("Scenario default units are: %s\n", scenario.Units.DateFormat);
fprintf("SelectedRestartTime will be set to %s\n", lastSelectedRestartTime);
filter1.ProcessControl.SelectedRestartTime = lastSelectedRestartTime;
fprintf("SelectedRestartTime was set to %s\n", filter1.ProcessControl.SelectedRestartTime);


% Compound Types
% OD Tool Kit uses a number of compound types that have special methods for handling Units, Dimensions,
% Date representations, and coordinate system transformations as well as standard containers such as lists and sets.

% Type QUANTITY

% Quantities are values that have an associated unit, such as: 1 sec, 5 km, and 3 rad/sec. Several methods and
% properties are available to work with the quantity attributes.

% The properties Unit and Dimension return the default unit and dimension.

fprintf("Unit: %s\n", filter1.ProcessControl.TimeSpan.Unit);
fprintf("Dimension: %s\n", filter1.ProcessControl.TimeSpan.Dimension);

% The methods GetIn() and Set() perform unit conversion based on the input unit.

filter1.ProcessControl.TimeSpan.Set(4, 'min');
fprintf("%f min\n", filter1.ProcessControl.TimeSpan.GetIn("min"));
fprintf("%f sec\n", filter1.ProcessControl.TimeSpan.GetIn("sec"));

% In addition to working with one of the scenario object quantities you can create a new quantity object with the
% ODTK.NewQuantity() function. The returned quantity object can be either assigned to one of the existing attributes
% or used to perform a unit conversion.

temp = odtk.NewQuantity(2, "arcSec");
facility.MeasurementStatistics{2}.Type.Bias = temp;
trackingSystem.IonosphereModel.TransmitFreq = odtk.NewQuantity(2100, "MHz");
qty = odtk.NewQuantity(100, "mi/hr");
fprintf("Quantity: %f km/sec\n", qty.GetIn("km/sec"));

% Type DATE

% Dates are treated similarly to Quantities. They have a Set() method to assign a value and a Format() method to
% retrieve the DateTime string in a specified format. You can create a new Date object using the odtk.NewDate()
% function. The first parameter is the value or string containing the date, the second parameter is one of the
% standard ODTK date formats.

jd1 = odtk.NewDate(1, "JDate");
fprintf("JDate: %s\n", jd1.Format("UTCG"));

% The Set() function returns a handle to the Date object that is being modified. The input parameters are the same as
% the NewDate function.

filter1.ProcessControl.StartTime.Set(1, "JDate");
fprintf("JDate: %s\n", filter1.ProcessControl.StartTime.Format("GPSG"));

% ODTK's Date object also implements three Date Time arithmetic methods, AddTime, SubtractTime, and SubtractDate.

d1 = filter1.ProcessControl.StartTime;
d2 = filter1.ProcessControl.StopTime;
d3 = d1.AddTime(odtk.NewQuantity(1, "hr"));
d4 = d2.SubtractTime(odtk.NewQuantity(5, "min"));
timeSpan = d4.SubtractDate(d3);
fprintf("Timespan: %f min\n", timeSpan.GetIn('min'));

% In addition to arithmetic functions, these functions allow date comparison:
% Equals(), GreaterThan(), GreaterThanOrEqual(), Inequality(), LessThan(), LessThanOrEqual()

t1 = simulator.ProcessControl.StartTime;
t2 = filter1.ProcessControl.StartTime;

fprintf("t1: %s\n", t1.Format('UTCG'));
fprintf("t2: %s\n", t2.Format('UTCG'));
if t1.GreaterThan(t2)
    fprintf("t1 > t2\n");
end
if t1.GreaterThanOrEqual(t2)
    fprintf("t1 >= t2\n");
end
if t1.GreaterThanOrEqual(t1)
    fprintf("t1 >= t1\n")
end
if t1.LessThanOrEqual(t1)
    fprintf("t1 <= t1\n")
end
if t1.Equals(t1)
    fprintf("t1 == t1\n")
end
if t1.Inequality(t2)
    fprintf("t1 != t2\n")
end
if t2.LessThan(t1)
    fprintf("t2 < t1\n")
end
if t2.LessThanOrEqual(t1)
    fprintf("t2 <= t1\n")
end

% Date objects are often useful when converting date and time formats from other software or systems. At times it's
% useful to start up ODTK and use it as a crude data conversion utility! Sometimes the input format is not one that
% ODTK natively supports. However, a little judicious string manipulation can often reorganize the input date and
% time into something that ODTK can handle. For example, you may have a date and time format that consists of the
% year and the elapsed seconds since the beginning of the year (assumed to be 1 Jan 00:00:00 UTC), e.g. 2009/2560004.
%  You could rely on your own date conversion routines and worry about leap years and leap seconds. Or you could
% simply pass it into ODTK using something like the following and then request it back out in a different format.

testDate = odtk.NewDate("1 Jan 2009 00:00:256", "UTCG");
fprintf("testDate: %s\n", testDate.Format("UTCG"));
testDate = odtk.NewDate("001/2560004 2009", "GMT");
fprintf("testDate: %s\n", testDate.Format("UTCG"));

% Type LINKTO

% File and directory names are strings but they are validated during the assignment. The application makes sure that
% an input file exists, or an output file can be written. Otherwise it will generate an error and the new value will
% not be set:
           
try
    % set non-existent file
    scenario.EarthDefinition.EOPFilename = "C:\\Non-Existent-Folder\\none-existent-file.txt";
    throw(MException('ScriptingGuide:unexpectedError', 'The expected exception was not thrown.'));
catch ex
    if ex.identifier == ClientExceptionIDs.ExecutionError && contains(ex.message, "Cannot find file")
        fprintf("Non-existent file path threw an exception as expected.\n");
    else
        throw(MException('ScriptingGuide:unexpectedError', 'An unexpected exception was thrown.'));
    end
end

% Type LINKTO ENUMERATION

% Some objects have links to enumerated types such as the solar radiation pressure model or measurement bias model
% and are identified as having type "LINKTO ENUMERATION". These parameters have an extra attribute "Type" that is
% used to set and get their values.

satellite.ForceModel.SolarPressure.Model.Type = "Spherical";
fprintf("Solar pressure model: %s\n", satellite.ForceModel.SolarPressure.Model.Type);

% currently doesn't work with ODTKRuntime (scenario.Measurements.Files is empty)
demonstrateList = true;

if demonstrateList
    % Type LIST

    % The List container holds an unordered list of simple types like STRINGs or INTs or compound objects. The
    % easiest way to identify what types of objects are in a list is to add an element through the user interface.
    % The columns in the list identify the names of each of the properties of the elements. Use the NewElem() method
    % to create a new object that can be added to the list. Actually adding it to the list is accomplished using
    % push_back(ne) or push_front(ne). The entire list can be cleared using clear() and the ith element removed using
    %  RemoveAt(i). The number of elements in the list is available using size(). Elements in the list can be
    % accessed by index number or by iterating through the list.
    measurementFiles = scenario.Measurements.Files;
    fprintf("Measurement files count: %i\n", measurementFiles.count);
    measurementFile = measurementFiles{0};
    measurementFileName = measurementFile.FileName.value;
    fprintf("First measurement file: %s\n", measurementFileName);
    % Clear the list
    measurementFiles.clear();
    fprintf("Measurement files count: %i\n", measurementFiles.count);
    % Add a new item to it
    ne = measurementFiles.NewElem();
    ne.Enabled = true;
    ne.FileName = measurementFileName;
    measurementFiles.push_back(ne);
    fprintf("Measurement files count: %i\n", measurementFiles.count);
    % Walk through the list using indices
    for i = 0: measurementFiles.size-1   
        fprintf("Measurement file (%i): %s\n", i, measurementFiles{i}.FileName.value);
    end    
end

% Type SETLINKTOOBJ

% Some ODTK objects have a special container SetLinkToObj that acts like a Set (in that only unique items can be
% contained in it) and the unique items are links to other ODTK objects. A common example of this is a Filter
% object's SatelliteList. You can choose to add specific satellite objects into the SatelliteList, but you can only
% add the satellite once. Use the InsertbyName() method to add a new object into the list. Alternatively,
% you can retrieve the list in your script via the Choices property. The entire SetLinkToObj can be cleared using
% clear() and an individual element removed using erase(). The number of elements in the SetLinkToObj is available
% using size(). Elements in the SetLinkToObj can be accessed by index number or by iterating through the
% SetLinkToObj. The methods begin() and end() return iterators that have the following methods:
% IsSafeToDereference(), Dereference(), Increment(), and Decrement().

% Clear out the existing SatelliteList
filter1.SatelliteList.clear();

% Add a particular satellite called Fred
success = filter1.SatelliteList.InsertByName("mySat");
fprintf("%s\n", string(success));

% Iterate through the list of possible choices we could have used
satelliteChoices = filter1.SatelliteList.Choices;
for i = 0: satelliteChoices.Count-1
    fprintf("  %i. %s\n", i, satelliteChoices{i});
end

% Add the 2nd satellite to the list (0 indexed)
filter1.SatelliteList.insert(filter1.SatelliteList.Choices{1});

% Remove Fred from the list
filter1.SatelliteList.erase("mySat");

% Type SET

% The Set container is similar to a list but is ordered by an internal constraint and will reject duplicates. Use the
%  NewElem() method to create a new object that can be added to the Set. Actually adding it to the list is
% accomplished using insert(ne). The entire Set can be cleared using clear() and an individual element removed using
% erase(). The number of elements in the Set is available using size(). Elements in the Set can be accessed by index
% number or by iterating through the Set. Some Sets such as MeasurementStatistics have additional methods that are
% useful such as InsertByName(string), RemoveByName(string), and FindByName(string) where string is the name of the
% element being inserted, found, or removed. InsertByName() and RemoveByName() return a boolean indicating whether
% the element was successfully added or removed. Not all sets implement FindByName() and RemoveByName(),
% only the more commonly used sets do.

% The methods begin(), end(), and FindByName() return iterators that have the following methods: IsSafeToDereference(),
% Dereference(), Increment(), and Decrement().

% Clear out the set
measurementStatistics = facility.MeasurementStatistics;
measurementStatistics.clear();

% Add a range measurement model
success = measurementStatistics.InsertByName("Range");
fprintf("Range measurement model added: %s\n", string(success));
ms = measurementStatistics{measurementStatistics.count - 1};

ms.Type.BiasSigma.Set(10, "m");
ms.Type.BiasHalfLife.Set(6, "hr");
ms.Type.WhiteNoiseSigma.Set(4, "m");

% Add an azimuth measurement model
success = measurementStatistics.InsertByName("Azimuth");
fprintf("Azimuth measurement model added: %s\n", string(success));
ms = measurementStatistics{measurementStatistics.count - 1};

ms.Type.BiasSigma.Set(0.1, "deg");
ms.Type.BiasHalfLife.Set(6, "hr");
ms.Type.WhiteNoiseSigma.Set(0.05, "deg");

% Now remove the range model
success = measurementStatistics.RemoveByName("Range");
fprintf("Range model removed: %s\n", string(success));
    

% Special Cases

% Maneuver Sets

% -------------------------------------------------------
% Finite maneuver example
% -------------------------------------------------------

% Clear out any existing finite maneuvers and add a new
% one in.

finiteManeuvers = satellite.ForceModel.FiniteManeuvers;
finiteManeuvers.clear();

% Create a new maneuver to model a cross-track delta-I
fmIter = finiteManeuvers.InsertNew("FiniteManConstThrust");
if fmIter.IsSafeToDereference()
    fm = fmIter.Dereference();

    fm.Name = "FMTest1";
    fm.Enabled = true;
    fm.Frame = "Gaussian (RIC)";
    fm.Estimate = "MagnitudeAndPointing";

    % Configure the burn time
    fm.Time.StopMode = "TimeSpan";
    fm.Time.StartTime.Set("1 Jun 2009 00:00:00", "UTCG");
    fm.Time.TimeSpan.Set("45", "min");

    % Configure the burn parameters
    fm.Thrust.Specification = "ByComponent";
    fm.Thrust.ThrustX.Set(0, "N");
    fm.Thrust.ThrustY.Set(0, "N");
    fm.Thrust.ThrustZ.Set(2, "lbf");

    % Configure the mass loss
    fm.Mass.LossMethod = "BasedOnIsp";
    fm.Mass.Isp.Set(325.0, "sec");

    % Configure the burn uncertainty
    fm.Uncertainty.Type = "%MagnitudeAndPointing";
    fm.Uncertainty.PercentMagnitudeSigma.Set(3.0, "%");
    fm.Uncertainty.PointingSigma.Set(1.5, "deg");
    fm.Uncertainty.MagnitudeHalfLife.Set(1, "hr");
    fm.Uncertainty.PointingHalfLife.Set(1, "hr");
end

% Add in a second maneuver as a dummy maneuver just
% to prove that we can find the right maneuver
fmIter = finiteManeuvers.InsertNew("FiniteManConstThrust");

if fmIter.IsSafeToDereference()
    fm = fmIter.Dereference();

    % We'll set the name and accept the defaults for all the
    % other parameters.
    fm.Name = "FMTest2";
end

% Now try to find the first maneuver and report the
% thrust.

fmIter = finiteManeuvers.FindByName("FMTest1");
if fmIter.IsSafeToDereference()
    fm = fmIter.Dereference();

    fprintf("Found maneuver %s\nThrust is %f lbf\n", fm.Name, fm.Thrust.ThrustZ.GetIn("lbf"));
end

% Now delete the second maneuver

fmIter = finiteManeuvers.FindByName("FMTest2");
if fmIter.IsSafeToDereference()
    fm = fmIter.Dereference();

    fprintf("Found maneuver %s\nThrust is %f lbf\n", fm.Name, fm.Thrust.ThrustZ.GetIn("lbf"));

    finiteManeuvers.RemoveByName("FMTest2");
end

% Verify that the second maneuver is gone.

fmIter = finiteManeuvers.FindByName("FMTest2");
if ~fmIter.IsSafeToDereference()
    fprintf("Second maneuver was deleted\n");
end

% -------------------------------------------------------
% Impulsive maneuver example
% -------------------------------------------------------

% Clear out any existing instant maneuvers and add a new
% one in.

instantManeuvers = satellite.ForceModel.InstantManeuvers;
instantManeuvers.clear();

% Create a new maneuver to model an in-track delta-V

imIter = instantManeuvers.InsertNew("InstantManDeltaV");

if imIter.IsSafeToDereference()
    im = imIter.Dereference();

    im.Name = "IMTest1";
    im.Enabled = true;
    im.Frame = "Gaussian (RIC)";

    % Configure the burn time (assumes the actual burn is
    % 4 minutes long but is modeled as an impulsive burn)

    im.Epoch.Set("1 Jan 2009 01:23:45", "UTCG");
    im.TimeAfterStart.Set(2, "min");
    im.TimeBeforeEnd.Set(2, "min");

    % Configure the burn parameters

    im.DeltaV.Specification = "ByComponent";
    im.DeltaV.DeltaVX.Set(0.0, "m/sec");
    im.DeltaV.DeltaVY.Set(0.1, "m/sec");
    im.DeltaV.DeltaVZ.Set(0.0, "m/sec");

    % Configure the mass loss

    im.Mass.LossMethod = "Explicit";
    im.Mass.MassLoss.Set(1, "kg");

    % Configure the burn uncertainty

    im.Uncertainty.Type = "ByComponent";
    im.Uncertainty.XSigma.Set(0.01, "m/sec");
    im.Uncertainty.YSigma.Set(0.02, "m/sec");
    im.Uncertainty.ZSigma.Set(0.01, "m/sec");
end

% Add in a second maneuver as a dummy maneuver just
% to prove that we can find the right maneuver

imIter = instantManeuvers.InsertNew("InstantManDeltaV");

if imIter.IsSafeToDereference()
    im = imIter.Dereference();

    % We'll set the name and accept the defaults for all the
    % other parameters.

    im.Name = "IMTest2";
end

% Now try to find the first maneuver and report the delta-V

imIter = instantManeuvers.FindByName("IMTest1");
if imIter.IsSafeToDereference()
    im = imIter.Dereference();
    fprintf("Found maneuver %s\nDelta-V is %f m/sec\n", im.Name, im.DeltaV.DeltaVY.GetIn("m/sec"));
end

% Now delete the second maneuver

imIter = instantManeuvers.FindByName("IMTest2");

if imIter.IsSafeToDereference()
    fprintf("Found second maneuver\n");

    instantManeuvers.RemoveByName("IMTest2");
end

% Verify that it is gone.

imIter = instantManeuvers.FindByName("IMTest2");
if ~imIter.IsSafeToDereference()
    fprintf("Second maneuver was deleted\n");
end


% Multiple representations: Facility.Position

% The Facility.Position is a multiple representation object. Changes must be applied to the entire scope at once to
% ensure the proper coordinate transformation. To do that, first get position elements in one of the available
% representations: ToCartesian(), ToGeodetic(), ToGeocentric(), ToCylindrical(), and ToSpherical(). Then modify
% individual elements of the temp variable and then assign them back at once.

pos = facility.Position.ToGeodetic();
printGeodeticPos(pos);

pos.Lat.Set(10, 'deg');
pos.Lon.Set(20, 'deg');
pos.Alt.Set(100, 'm');

facility.Position.Assign(pos);
pos = facility.Position.ToGeodetic();
printGeodeticPos(pos);


% Multiple representations: Satellite.OrbitState

% Similarly Satellite.OrbitState's individual members defining the orbit state vector must be changed in a temp
% variable and then assigned back as a group.

kep = satellite.OrbitState.ToKeplerian();
printKeplerianOrbitState(kep);
% Raise altitude by 10 km

newSize = kep.SemiMajorAxis.GetIn("km");
kep.SemiMajorAxis.Set(newSize + 10, "km");

% Set the rest of the orbital elements

kep.Epoch.Set("1 Jul 2009 00:00:00", "UTCG");
kep.Eccentricity = 0.00123;
kep.TrueArgOfLatitude.Set("33.3", "deg");
kep.Inclination.Set("67.8", "deg");
kep.RAAN.Set("321.123", "deg");
kep.ArgOfPerigee.Set("3.141592654", "rad");

kep = satellite.OrbitState.Assign(kep);
printKeplerianOrbitState(satellite.OrbitState.ToKeplerian());

% Type LINKTOOBJ with "not specified" choice

% The LINKTOOBJ type is a pointer to a specific group of objects, which sometimes can offer a "not specified" choice.
% Examples are the GNSSReceiver.DefaultAntenna, Transponder.DefaultAntenna, and Facility.ReferenceEmitter attributes.

gpsr = odtk.application.createObj(satellite, "GNSSReceiver", 'GNSSReceiver1');
antenna = odtk.application.createObj(gpsr, "Antenna", "Antenna1");
for i = 0: gpsr.DefaultAntenna.Choices.Count-1
    choice = gpsr.DefaultAntenna.Choices{i};
    if isa(choice, 'string')
        fprintf("%s\n", choice);
    else
        fprintf("%s\n", choice.name);
    end
end

gpsr.DefaultAntenna = "not specified";
fprintf("Antenna 1: %s\n", gpsr.DefaultAntenna.ID);
gpsr.DefaultAntenna = gpsr.Antenna{0};
fprintf("Antenna 2: %s\n", gpsr.DefaultAntenna.ID);

% Product Builder: Creating Reports and Graphs

% Building and Using a Data Product List

% The script example below assumes there is no existing data product list. So it builds a data product each time it
% is called to produce the desired output.

odtk.ProductBuilder.DataProducts.Clear();

archiveFileName = scenario.Filter{0}.Output.DataArchive.Filename.value;
fprintf("Archive file: %s\n", archiveFileName);
styleFilePath = [thisFolderPath, filesep, '..', filesep, 'SharedResources', filesep, 'measHist.exp'];
outputFilePath = [thisFolderPath, filesep, 'measHist.txt'];
runReport(odtk, archiveFileName, styleFilePath, "measHist", outputFilePath);


% Setting a custom location for the ODTK log file

% By default ODTK will create its log in a user temp directory and delete it upon application exit.
% However, you may override this by using the following commands:

appendMode = true;
logfilePath = [thisFolderPath, filesep, 'log.txt'];
odtk.Application.SetLogFile(logfilePath, appendMode);

logLevelDebug = 0;
logLevelInfo = 1;
logLevelForceInfo = 2;
logLevelWarning = 3;
logLevelError = 4;

odtk.Application.LogMsg(logLevelInfo, "LogFile = " + odtk.Application.LogFile);
odtk.Application.LogMsg(logLevelWarning, "This is a warning message.");
odtk.Application.LogMsg(logLevelError, "This is an error message.");


% Using ODTK.WriteMessage() function

% WriteMessage works for desktop only; the Runtime accepts the command and returns true but does not write a message.

odtk.WriteMessage("Example error message...", "error");
odtk.WriteMessage("Example warning message...", "warn");
odtk.WriteMessage("Example forced message...", "force");
odtk.WriteMessage("Example info message...", "info");
odtk.WriteMessage("Example debug message...", "debug");
odtk.WriteMessage("Yawn", "sleep 1000");  % Causes system sleep for 1 sec


% functions

function printKeplerianOrbitState(os)
    fprintf("Epoch : %s UTCG, Eccentricity: %f, " + ...
            "TrueArgOfLatitude: %f deg, Inclination: %f deg, " + ...
            "RAAN: %f deg, ArgOfPerigee: %f deg rad\n", ...
            os.Epoch.Format("UTCG"), ...
            os.Eccentricity, ...
            os.TrueArgOfLatitude.GetIn("deg"), ...
            os.Inclination.GetIn("deg"), ...
            os.RAAN.GetIn("deg"), ...
            os.ArgOfPerigee.GetIn("rad"));
end

function printGeodeticPos(p)
    fprintf("Lat : %f deg, Lon: %f deg, Alt: %f m\n", ...
        p.Lat.GetIn("deg"), ...
        p.Lon.GetIn("deg"), ...
        p.Alt.GetIn("m"));
end

% Generic function to build and create a product.
function runReport(odtk, inputFileName, stylePath, productName, exportFilePath)
    % Create a new data product at the end of the list

    newElem = odtk.ProductBuilder.DataProducts.NewElem();
    odtk.ProductBuilder.DataProducts.push_back(newElem);
    index = odtk.ProductBuilder.DataProducts.size - 1;
    product = odtk.ProductBuilder.DataProducts{index};

    % Configure the the data product

    newSrc = product.Inputs.DataSources.NewElem();
    product.Inputs.DataSources.push_back(newSrc);

    product.Name.Assign(productName);
    product.Inputs.DataSources{0}.Filename = inputFileName;
    product.Outputs.Style = stylePath;
    product.Outputs.Display = true;

    product.Outputs.Export.Enabled = true;
    product.Outputs.Export.Format = "CommaSeparated";
    product.Outputs.Export.FileName = exportFilePath;

    % Create the product

    if ~odtk.ProductBuilder.GenerateProduct(productName)
        throw(MException('ScriptingGuide:unexpectedError', 'GenerateProduct failed. Please check the log for more details.'));
    end
    fprintf("%s exported to %s\n", inputFileName, exportFilePath);    
end
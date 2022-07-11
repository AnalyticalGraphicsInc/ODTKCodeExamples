<?xml version = "1.0" standalone = "yes"?>
<VAR name = "ODTK">
    <PROP name = "Version">
        <STRING>&quot;7.0&quot;</STRING>
    </PROP>
    <SCOPE>
        <VAR name = "Baseline">
            <SCOPE Class = "Scenario">
                <PROP name = "version">
                    <STRING>&quot;7.4&quot;</STRING>
                </PROP>
                <VAR name = "Description">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "OverrideRunName">
                    <BOOL>false</BOOL>
                </VAR>
                <VAR name = "NewRunFilename">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "DefaultTimes">
                    <SCOPE Class = "DefaultTimes">
                        <VAR name = "Processes">
                            <SCOPE Class = "Processes">
                                <VAR name = "StartMode">
                                    <STRING>&quot;EarliestSatEpoch&quot;</STRING>
                                </VAR>
                                <VAR name = "StartTime">
                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                </VAR>
                                <VAR name = "StopMode">
                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                </VAR>
                                <VAR name = "StopTime">
                                    <DATE>2 Jul 2021 12:00:37.000</DATE>
                                </VAR>
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>24</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Intervals">
                            <SCOPE Class = "Intervals">
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>4</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Measurements">
                    <SCOPE Class = "TrackingFiles">
                        <VAR name = "Files">
                            <LIST />
                        </VAR>
                        <VAR name = "RoundTripRepresentation">
                            <STRING>&quot;OneWay&quot;</STRING>
                        </VAR>
                        <VAR name = "LookAheadBufferSize">
                            <INT>100</INT>
                        </VAR>
                        <VAR name = "EmbeddedWNSigmas">
                            <SCOPE>
                                <VAR name = "Use">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OnInputError">
                                    <STRING>&quot;UseDefaultWNSigma&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "ViewAndSave">
                            <SCOPE Class = "ViewAndSave">
                                <VAR name = "CustomDataEditing">
                                    <SCOPE Class = "CustomDataEditing">
                                        <VAR name = "Enabled">
                                            <BOOL>false</BOOL>
                                        </VAR>
                                        <VAR name = "Schedule">
                                            <LIST />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "StateControls">
                    <SCOPE Class = "StateControls">
                        <VAR name = "MinApogeeAltForSRP">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>400</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "MaxPerigeeAltForDrag">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>1000</REAL>
                            </QUANTITY>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "OrbitClassifications">
                    <SCOPE Class = "OrbitClassifications">
                        <VAR name = "LEO">
                            <SCOPE Class = "LEOOrbitClass">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>6441.91837</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "MEO">
                            <SCOPE Class = "MEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GPS">
                            <SCOPE Class = "GPS">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GEO">
                            <SCOPE Class = "GEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33159999999</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "SGEO">
                            <SCOPE Class = "GSGEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33159999999</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HEO">
                            <SCOPE Class = "HEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.73</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "LOeHEO">
                            <SCOPE Class = "LOeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.2</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HIeHEO">
                            <SCOPE Class = "HIeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.73</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Para">
                            <SCOPE Class = "Para">
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Hyper">
                            <SCOPE Class = "Hyper">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>-63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>10000000000</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "EarthDefinition">
                    <SCOPE>
                        <VAR name = "LeapSecondFilename">
                            <STRING>&quot;/home/odtk/DynamicEarthData/LeapSecond.dat&quot;</STRING>
                        </VAR>
                        <VAR name = "GravityModel">
                            <STRING>&quot;/home/odtk/STKData/CentralBodies/Earth/EGM2008.grv&quot;</STRING>
                        </VAR>
                        <VAR name = "OverrideGravityProcessNoise">
                            <BOOL>false</BOOL>
                        </VAR>
                        <VAR name = "NutationMethod">
                            <STRING>&quot;IERS1996&quot;</STRING>
                        </VAR>
                        <VAR name = "EclipsingAtmosAlt">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>23.862995940238</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "GroundReflectionModel">
                            <STRING>&quot;/home/odtk/STKData/CentralBodies/Earth/SimpleReflectionModel.txt&quot;</STRING>
                        </VAR>
                        <VAR name = "EOPData">
                            <SCOPE>
                                <VAR name = "Filename">
                                    <STRING>&quot;/home/odtk/DynamicEarthData/EOP-v1.1.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "FluxData">
                            <SCOPE>
                                <VAR name = "InputMethod">
                                    <STRING>&quot;Read From File&quot;</STRING>
                                </VAR>
                                <VAR name = "InputFluxFile">
                                    <STRING>&quot;/home/odtk/DynamicEarthData/SpaceWeather-v1.2.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "F10">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "F10bar">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "KpUpdate">
                                    <STRING>&quot;3-Hourly&quot;</STRING>
                                </VAR>
                                <VAR name = "KpSubSamplingRatio">
                                    <INT>1</INT>
                                </VAR>
                                <VAR name = "UseApOrKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "ApVersusKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "Ap">
                                    <REAL>8.113124895222496</REAL>
                                </VAR>
                                <VAR name = "Kp">
                                    <REAL>2.209975772807119</REAL>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "JacchiaBowmanIndices">
                                    <SCOPE>
                                        <VAR name = "InputJBSolarIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "InputJBGeoMagIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "M10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "M10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "DstDTc">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Ionosphere">
                            <SCOPE>
                                <VAR name = "IRI20xxDataDirectory">
                                    <STRING>&quot;/home/odtk/DynamicEarthData/IRI2016ModelData\&quot;</STRING>
                                </VAR>
                                <VAR name = "ApSource">
                                    <STRING>&quot;SpaceWeatherFile&quot;</STRING>
                                </VAR>
                                <VAR name = "SpaceWeatherFilename">
                                    <STRING>&quot;/home/odtk/DynamicEarthData/SpaceWeather-All-v1.2.txt&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "DSNMediaCalibrationData">
                            <SCOPE Class = "DSNMediaCalibrationFile">
                                <VAR name = "Files">
                                    <LIST />
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SuppressICRF">
                    <BOOL>false</BOOL>
                </VAR>
                <VAR name = "CentralBodyList">
                    <LIST>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Ceres&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Ceres/CERES18D.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Mars&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Mars/GMM3.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Mercury&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Mercury/GGMES100v08.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Moon&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Moon/GL0660B.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Moon/SimpleReflectionModel.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Sun&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Sun/ZonalsToJ4.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Venus&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;/home/odtk/STKData/CentralBodies/Venus/MGNP180U.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                                <VAR name = "EstimateOrbitCorrection">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OrbitUncertainty">
                                    <SCOPE>
                                        <VAR name = "R_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>2000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "I_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "C_sigma">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                <REAL>20000</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Rdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Idot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "Cdot_sigma">
                                            <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                <REAL>1</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "RI_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IC_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "ICdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CRdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "CCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotIdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "RdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                        <VAR name = "IdotCdot_correlation">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </LIST>
                </VAR>
                <VAR name = "PlanetaryEphemeris">
                    <SCOPE Class = "PlanetaryEphemeris">
                        <VAR name = "Filename">
                            <STRING>&quot;/home/odtk/STKData/PlanetEphem/lendian/plneph.430&quot;</STRING>
                        </VAR>
                        <VAR name = "UseTDB">
                            <BOOL>true</BOOL>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SPICE">
                    <SCOPE Class = "SPICE" />
                </VAR>
                <VAR name = "SatEphemeris">
                    <SCOPE Class = "SatEphemeris">
                        <VAR name = "CoordFrame">
                            <LIST>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Ceres&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;ICRF&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Mars&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Mercury&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Moon&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Sun&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;ICRF&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Venus&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </LIST>
                        </VAR>
                        <VAR name = "CCSDS">
                            <SCOPE Class = "OEM">
                                <VAR name = "Originator">
                                    <STRING>&quot;ODTK&quot;</STRING>
                                </VAR>
                                <VAR name = "DateFormat">
                                    <STRING>&quot;YMD&quot;</STRING>
                                </VAR>
                                <VAR name = "TimePrecision">
                                    <INT>6</INT>
                                </VAR>
                                <VAR name = "EphemerisFormat">
                                    <STRING>&quot;SciNotation&quot;</STRING>
                                </VAR>
                                <VAR name = "OutputVersion">
                                    <STRING>&quot;2.0&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Units">
                    <SCOPE Class = "Units">
                        <VAR name = "DateFormat">
                            <STRING>&quot;UTCG&quot;</STRING>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "QuasarDatabaseFilename">
                    <STRING>&quot;/home/odtk/Databases/Quasars/DSN_RadioSourceCatalog_107E.txt&quot;</STRING>
                </VAR>
                <VAR name = "FacilityAssociationsFile">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "Wizard">
                    <SCOPE Class = "WizardClass">
                        <VAR name = "StartTime">
                            <DATE>1 Jul 2021 12:00:37.000</DATE>
                        </VAR>
                        <VAR name = "StopTime">
                            <DATE>2 Jul 2021 12:00:37.000</DATE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Children">
                    <SCOPE>
                        <VAR name = "Satellite">
                            <SCOPE>
                                <VAR name = "Satellite1">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.4&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Keplerian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>6678.137</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>6.789530297717651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.686414173013651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>1000</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>21</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>4902794000000</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;HPOP Historical&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Sun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>1.32712438e+20</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;HPOP Historical&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;Based On Orbit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;CIRA 1972&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.2</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.044</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>180</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;Based On Orbit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.02</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with perfect absorption&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;Apparent&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "BoundaryMitigation">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>86400</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1440</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;/home/odtk/.ODTK7/Ephemeris/Satellite1.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>50</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.06</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.04</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.02</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;Satellite1&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SPICE">
                                            <SCOPE />
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "Satellite2">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.4&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Keplerian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>6678.137</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>6.789530297717651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.686414173013651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>1001</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>21</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>4902794000000</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;HPOP Historical&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Sun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>1.32712438e+20</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;HPOP Historical&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;Based On Orbit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;CIRA 1972&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.2</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.044</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>180</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;Based On Orbit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.02</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with perfect absorption&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;Apparent&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "BoundaryMitigation">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>86400</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1440</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;/home/odtk/.ODTK7/Ephemeris/Satellite1.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>50</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.06</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.04</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.02</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;Satellite2&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SPICE">
                                            <SCOPE />
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Simulator">
                            <SCOPE>
                                <VAR name = "Simulator">
                                    <SCOPE Class = "Simulator">
                                        <PROP name = "version">
                                            <STRING>&quot;7.4&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "SatelliteList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "TrackingStrandList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all tracking strands to be used&quot;</STRING>
                                            </PROP>
                                            <LIST />
                                        </VAR>
                                        <VAR name = "EmitterList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "MeasTypes">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                            </PROP>
                                            <LIST />
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;Initial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "SelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2021 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "AutoSelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2021 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;StopTime&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopTime">
                                                    <DATE>2 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>24</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "NumOrbitsAllowedForEpochAlignment">
                                                    <INT>15</INT>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jul 2000 00:00:32.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "EnableDeepSpaceMode">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Restart">
                                            <SCOPE>
                                                <VAR name = "SaveRecordsToFile">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MaxRecordsInFile">
                                                    <INT>100</INT>
                                                </VAR>
                                                <VAR name = "SaveFrequency">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "BackupRestartRecords">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "StochasticModelUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Source">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClockUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SatelliteMassUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ResetGPSUTCSteering">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CustomTrackingIntervals">
                                            <SCOPE>
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "OverrideValidity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "IntervalFileLinks">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "ImportMeasFileSchedule">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ErrorModeling">
                                            <SCOPE Class = "ErrorModeling">
                                                <VAR name = "NoDeviations">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateOrbits">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateDensity">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateBCoeff">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateSolarP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateTranspDelay">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateRetroDelay">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateMeasBiases">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateTropoBiases">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateManeuvers">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "AddProcessNoise">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "AddManeuverProcessNoise">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "AddMeasWhiteNoise">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateStationLocations">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateAntennaLocations">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateClocks">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateMeasTimeBias">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateAccelerometers">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateGlobalDensity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "AddGlobalDensityProcessNoise">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateEmpiricalForces">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateCentralBodyOrbits">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "RandomSeed">
                                                    <LONG>1</LONG>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ErrorScaling">
                                            <SCOPE Class = "ErrorScaling">
                                                <VAR name = "Orbits">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Density">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "BCoeff">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "SolarP">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "TranspDelay">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "RetroDelay">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "MeasBiases">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "TropoBiases">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Maneuvers">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "StationLocations">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "AntennaLocations">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Clocks">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "MeasTimeBias">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Accelerometers">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "GlobalDensity">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "CentralBodyOrbits">
                                                    <REAL>1</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceSequencePositive">
                                            <SCOPE Class = "ForceSequencePositive">
                                                <VAR name = "Density">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "BCoeff">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "SolarP">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TranspDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "RetroDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "UpdateFilterTimes">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE>
                                                <VAR name = "Measurements">
                                                    <SCOPE>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;/home/odtk/.ODTK7/TrackingData/Baseline.gobs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AliasMapping">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputByPass">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PassFileBaseName">
                                                            <STRING>&quot;/home/odtk/.ODTK7/TrackingData/Baseline&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PassFileDefaultExtension">
                                                            <STRING>&quot;gobs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UpdateScenario">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;/home/odtk/.ODTK7/DataArchive/Baseline.simrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileUpdateMethod">
                                                            <STRING>&quot;Overwrite&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "OutputMeasHistory">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputSummary">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputHistograms">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "HistogramSize">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "NumberHistogramBins">
                                                            <INT>22</INT>
                                                        </VAR>
                                                        <VAR name = "OutputGPSSVMeasInfo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputPerturbations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Uniform&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>2 Jul 2021 00:00:37.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Satellite2&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Satellite1&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;/home/odtk/.ODTK7/Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;SPICE bsp&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Events">
                                            <SCOPE>
                                                <VAR name = "OnInternalError">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnStart">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnComplete">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnHalt">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Filter">
                            <SCOPE>
                                <VAR name = "Filter">
                                    <SCOPE Class = "Filter">
                                        <PROP name = "version">
                                            <STRING>&quot;7.4&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "SatelliteList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "TrackerList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all trackers to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "EmitterList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "GNSSList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all GNSS Systems to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "MeasTypes">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                            </PROP>
                                            <LIST />
                                        </VAR>
                                        <VAR name = "RejectMeasTypes">
                                            <LIST />
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "Direction">
                                                    <STRING>&quot;Forward&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;Initial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "SelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2021 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "AutoSelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2021 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "RestartLastMeasTime">
                                                    <STRING>&quot;01 Jul 2021 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;LastMeasurement&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopTime">
                                                    <DATE>2 Jul 2021 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>24</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ProcessNoiseUpdateInterval">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "MeasurementProcessingMode">
                                                    <STRING>&quot;Scalar&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasurementModelingMode">
                                                    <STRING>&quot;Estimation&quot;</STRING>
                                                </VAR>
                                                <VAR name = "NumOrbitsAllowedForEpochAlignment">
                                                    <INT>15</INT>
                                                </VAR>
                                                <VAR name = "EnableVLS">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasUpdateOrbitStateRepresentation">
                                                    <STRING>&quot;Cartesian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceUpdateForm">
                                                    <STRING>&quot;OptimalGain&quot;</STRING>
                                                </VAR>
                                                <VAR name = "EnableDeepSpaceMode">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DynamicStateSpace">
                                                    <SCOPE Class = "DynamicStateSpace">
                                                        <VAR name = "MeasBiases">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FiniteManeuverCorrections">
                                                            <STRING>&quot;Manual&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CorrelationThreshold">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuverEstimation">
                                                    <SCOPE Class = "InstantManeuverEstimation">
                                                        <VAR name = "Estimate">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Formulation">
                                                            <STRING>&quot;CarltonRauch&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseMaximumLag">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "MaximumLag">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>120</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "UseCovarianceReduction">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "MinimumCovarianceReduction">
                                                            <REAL>0.001</REAL>
                                                        </VAR>
                                                        <VAR name = "NumMeasForCovarianceReduction">
                                                            <INT>5</INT>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "HigherOrderCorrections">
                                                    <SCOPE Class = "HigherOrderCorrections">
                                                        <VAR name = "MitigationMethod">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "SecondOrderGaussian">
                                                            <SCOPE Class = "SecondOrderGaussian">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;MeasurementAndTime&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateType">
                                                                    <STRING>&quot;ResidualAndDeweight&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                                <VAR name = "TimeUpdateNonlinearDetectionThreshold">
                                                                    <REAL>1e-06</REAL>
                                                                </VAR>
                                                                <VAR name = "DeweightingScaleFactor">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Underweighting">
                                                            <SCOPE Class = "Underweighting">
                                                                <VAR name = "Method">
                                                                    <STRING>&quot;ResidualVarianceCorrectionLimit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Mode">
                                                                    <STRING>&quot;AlwaysOn&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceCorrectionLimit">
                                                                    <REAL>10000</REAL>
                                                                </VAR>
                                                                <VAR name = "ResidualVarianceScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "MeasUpdateNonlinearDetectionThreshold">
                                                                    <REAL>0.5</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "UnscentedFilter">
                                                            <SCOPE Class = "UnscentedFilter">
                                                                <VAR name = "UpdateTypes">
                                                                    <STRING>&quot;Measurement&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CurvilinearUse">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ResampleOnProcessNoiseGrid">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Alpha">
                                                                    <REAL>0.1</REAL>
                                                                </VAR>
                                                                <VAR name = "Beta">
                                                                    <REAL>2</REAL>
                                                                </VAR>
                                                                <VAR name = "Kappa">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "IterateMeasUpdate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ResidualToWNIterationThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "MaxMeasUpdateIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "RcvrClockPartialsTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CurrentTime">
                                            <DATE>1 Jul 2021 12:00:37.000</DATE>
                                        </VAR>
                                        <VAR name = "CustomDataEditing">
                                            <SCOPE Class = "CustomDataEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "OverrideValidity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "SigmaEditing">
                                            <SCOPE Class = "SigmaEditing">
                                                <VAR name = "Defaults">
                                                    <SCOPE Class = "SigmaEditing">
                                                        <VAR name = "NominalSigma">
                                                            <REAL>3</REAL>
                                                        </VAR>
                                                        <VAR name = "Dynamic">
                                                            <SCOPE>
                                                                <VAR name = "Enabled">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "HighSigma">
                                                                    <REAL>100</REAL>
                                                                </VAR>
                                                                <VAR name = "NumRejectToStart">
                                                                    <INT>10</INT>
                                                                </VAR>
                                                                <VAR name = "NumAcceptToStop">
                                                                    <INT>3</INT>
                                                                </VAR>
                                                                <VAR name = "InitialHighSigmaDuration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CustomSigmas">
                                                    <SCOPE Class = "CustomSigmas">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Schedule">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ResidualEditing">
                                            <SCOPE Class = "ResidualEditing">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST />
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Restart">
                                            <SCOPE>
                                                <VAR name = "SaveRecordsToFile">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MaxRecordsInFile">
                                                    <INT>100</INT>
                                                </VAR>
                                                <VAR name = "SaveFrequency">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "BackupRestartRecords">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "StochasticModelUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Source">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClockUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SatelliteMassUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "OnStateSizeChange">
                                                    <SCOPE>
                                                        <VAR name = "StateReductionMethod">
                                                            <STRING>&quot;SimpleTruncation&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "IfCovGoesNegative">
                                                            <SCOPE>
                                                                <VAR name = "Action">
                                                                    <STRING>&quot;PromptUser&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PercentSigmaDeweighting">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ResetGPSUTCSteering">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OptionalSolveForParms">
                                            <SCOPE Class = "OptionalSolveForParms">
                                                <VAR name = "MeasBiases">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "UseMeasBiasFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionType">
                                                    <STRING>&quot;CorrectionToConstantBias&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MeasBiasCorrectionFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jul 2000 00:00:32.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE Class = "Output">
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;/home/odtk/.ODTK7/DataArchive/Baseline.filrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileUpdateMethod">
                                                            <STRING>&quot;Overwrite&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "SaveCrossCorrelations">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "SaveOnlyLastMeasPerStep">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputMeasHistory">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputSummary">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputHistograms">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "HistogramSize">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "NumberHistogramBins">
                                                            <INT>22</INT>
                                                        </VAR>
                                                        <VAR name = "OutputGPSSVMeasInfo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Display">
                                                    <SCOPE Class = "Display">
                                                        <VAR name = "EveryNMeasUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "EveryNTimeUpdates">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "ShowPassTimes">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputClockReductionUpdates">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClearMsgLog">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "SmootherData">
                                                    <SCOPE Class = "SmootherData">
                                                        <VAR name = "Generate">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;/home/odtk/.ODTK7/Smoother/Baseline_Filter.rough&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeMode">
                                                            <STRING>&quot;FilterSpan&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StartTime">
                                                            <DATE>1 Jul 2021 12:00:37.000</DATE>
                                                        </VAR>
                                                        <VAR name = "StopTime">
                                                            <DATE>2 Jul 2021 12:00:37.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Filter&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>2 Jul 2021 00:00:37.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Satellite2&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;Satellite1&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;/home/odtk/.ODTK7/Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;SPICE bsp&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Debug">
                                                    <SCOPE Class = "Debug">
                                                        <VAR name = "Matrices">
                                                            <SCOPE Class = "Matrices">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;/home/odtk/.ODTK7/DataArchive/Filter_FilterDebug.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Eigenvalues">
                                                            <SCOPE Class = "Eigenvalues">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;/home/odtk/.ODTK7/DataArchive/Filter_EigenValues.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SecondOrder">
                                                            <SCOPE Class = "SecondOrder">
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Filename">
                                                                    <STRING>&quot;/home/odtk/.ODTK7/DataArchive/Filter_SecondOrder.txt&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Events">
                                            <SCOPE>
                                                <VAR name = "OnInternalError">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnResume">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnComplete">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnHalt">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnNoMoreMeas">
                                                    <STRING>&quot;/home/odtk/ODTK/AppData/Scripts/DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "TrackingSystem">
                            <SCOPE>
                                <VAR name = "Baseline">
                                    <SCOPE Class = "TrackingSystem">
                                        <PROP name = "version">
                                            <STRING>&quot;7.4&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "TroposphereModel">
                                            <SCOPE Class = "TroposphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;SCF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MappingFunction">
                                                    <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "IonosphereModel">
                                            <SCOPE Class = "IonosphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;IRI2016&quot;</STRING>
                                                </VAR>
                                                <VAR name = "TransmitFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>2267.5</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ReceiveFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>1815.7715</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE>
                                                <VAR name = "Facility">
                                                    <SCOPE>
                                                        <VAR name = "COOK-A">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.4&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.6077691884626331</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>4.180031239391997</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>271.51</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>765</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>382.5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>32</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>16</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>0.9999999999999999</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Doppler">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Doppler&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>100</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>50</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                                                <REAL>10</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "InstantaneousModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "CountInterval">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Azimuth">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Azimuth&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.03</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Elevation">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Elevation&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.02</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>3107</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>5.000000000000001</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Polynomials&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>316.889395933598</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>316.889395933598</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>-17.3804267644882</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>463.80980682373</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>-905.779109954834</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>-11513.2285766602</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>74576.19091796879</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>-194315.89453125</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>272453.529296875</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>-217317.03515625</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>93532.7119140625</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>-16957.3273925781</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>1815.7715</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GUAM-A">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.4&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.2376299664950234</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>2.528215435709799</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>217</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>190</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>95</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>30</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>15</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>0.9999999999999999</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Doppler">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Doppler&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>100</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>50</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                                                <REAL>10</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "InstantaneousModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "CountInterval">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Azimuth">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Azimuth&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.03</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Elevation">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Elevation&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.02</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>3707</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>5.000000000000001</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Polynomials&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>371.52609423548</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>371.52609423548</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>-42.2682639956474</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>57.4732894897461</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>568.020294189453</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>1765.54150390625</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>-17543.1162109375</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>41153.208984375</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>-42052.26171875</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>16787.8984375</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>1079.96484375</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>-1774.83813476563</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>1815.7715</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "HULA-A">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.4&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.3763327802369231</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>3.521339496619167</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>428.42</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>135</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>67.5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>28</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>14</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>0.9999999999999999</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Doppler">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Doppler&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>100</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>50</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                                                <REAL>10</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "InstantaneousModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "CountInterval">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Azimuth">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Azimuth&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.03</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Elevation">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Elevation&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.02</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>3507</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>5.000000000000001</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Polynomials&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>342.572227582335</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>342.572227582335</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>-50.235759973526</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>211.781728744507</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>-373.578193664551</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>-2192.91088867188</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>26229.4736328125</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>-94889.142578125</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>167540.4609375</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>-158239.697265625</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>76870.1953125</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>-15106.2524414063</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>1815.7715</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "REEF-A">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.4&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>-0.1268858341710848</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>1.263095182071409</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>-56.8</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>48</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>24</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>32</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>16</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>0.9999999999999999</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Doppler">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Doppler&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>100</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "Rate" Unit = "cm*sec^-1">
                                                                                                        <REAL>50</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                                                <REAL>10</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "InstantaneousModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "CountInterval">
                                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                                <REAL>1</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Azimuth">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Azimuth&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.03</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Elevation">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Elevation&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>false</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                        <REAL>0.08</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>60</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigma">
                                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                                <REAL>0.02</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>4105</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>5.000000000000001</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>377.634</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>377.634</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>1815.7715</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
            </SCOPE>
        </VAR>
    </SCOPE>
</VAR>
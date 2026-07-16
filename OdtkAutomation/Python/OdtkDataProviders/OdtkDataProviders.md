## this script will return a pandas dataframe of the specified ODTK export table fields
 
##### the script will 
   - create a temporary export style of the specified fields in the specified database
   - run the export style using the specified run file amd export the output as a csv
   - read the csv into a pandas dataframe

##### sample use:
\# specify the databse and fields you want data for. Format is DatabaseName.FieldName\
arrayTableAndNames = ['MeasurementHistory.Date Time', 'MeasurementHistory.Tracker ID', 'MeasurementHistory.Satellite ID', 'MeasurementHistory.Measurement Type', 'MeasurementHistory.Residual Ratio']\
\# specify the fil/smt/sim/... run file\
runPath = r'C:\somewhere\OdtkExample.filrun'\
\# run everything\
resRatios = GetData(odtk, arrayTableAndNames, runPath)
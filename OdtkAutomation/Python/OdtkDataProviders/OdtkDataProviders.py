# this script will return a pandas dataframe of the specified ODTK report table fields
# 
# the script will 
#   - create a temporary export style of the specified fields in the specified database
#   - run the export style using the specified run file amd export the output as a csv
#   - read the csv into a pandas dataframe
#
# sample use:
#   specify the databse and fields you want data for
#   arrayTableAndNames = ['MeasurementHistory.Date Time', 'MeasurementHistory.Tracker ID', 'MeasurementHistory.Satellite ID', 'MeasurementHistory.Measurement Type', 'MeasurementHistory.Residual Ratio']
#   specify the fil/smt/simrun file
#   runPath = r'C:\somewhere\OdtkExample.filrun'
#   resRatios = GetData(odtk, arrayTableAndNames, runPath)
#
# author: jens ramrath, agi
# date: 8 jul 2026

import pandas as pd
import tempfile
from odtk import Client
from pathlib import Path


# create an export style .exp file using the specified database fields
def SaveExportStyle(arrayTableAndNames, outPath):
    with open(outPath, 'w') as expFile:
        expFile.write('<?xml version = \"1.0\" standalone = \"yes\"?>\n')
        expFile.write('<VAR name = \"AGI Export Style\">\n')
        expFile.write('    <PROP name = \"Product\">\n')
        expFile.write('        <STRING>&quot;ODTK&quot;</STRING>\n')
        expFile.write('    </PROP>\n')
        expFile.write('    <PROP name = \"Version\">\n')
        expFile.write('        <STRING>&quot;7.0&quot;</STRING>\n')
        expFile.write('    </PROP>\n')
        expFile.write('    <SCOPE>\n')
        expFile.write('        <VAR name = \"DatabaseInfo\">\n')
        expFile.write('            <SCOPE />\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"Title\">\n')
        expFile.write('            <STRING>&quot;&quot;</STRING>\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"Description\">\n')
        expFile.write('            <STRING>&quot;&quot;</STRING>\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"ExportVariables\">\n')
        expFile.write('            <LIST>\n')
        for tableAndName in arrayTableAndNames:
            expFile.write('                <SCOPE>\n')
            expFile.write('                    <VAR name = \"Name\">\n')
            expFile.write('                        <STRING>&quot;' + tableAndName + '&quot;</STRING>\n')
            expFile.write('                    </VAR>\n')
            expFile.write('                </SCOPE>\n')

        expFile.write('            </LIST>\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"DataProviderList\">\n')
        expFile.write('            <LIST>\n')
        expFile.write('                <STRING>&quot;' + arrayTableAndNames[0].split('.')[0] + '&quot;</STRING>\n')
        expFile.write('            </LIST>\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"ShowHeaderRow\">\n')
        expFile.write('            <BOOL>true</BOOL>\n')
        expFile.write('        </VAR>\n')
        expFile.write('        <VAR name = \"ShowTableName\">\n')
        expFile.write('            <BOOL>false</BOOL>\n')
        expFile.write('        </VAR>\n')
        expFile.write('    </SCOPE>\n')
        expFile.write('</VAR>')



# build the report style in the static product builder and export csv output
def GenerateReport(runFilePath, style_path):
    # cerate temp path for output csv
    export_file_path = Path(style_path).with_suffix('.csv')
    # if a product named TempForExport already exists, delete it
    productCounter = 0
    for dataProduct in odtk.ProductBuilder.DataProducts:
        if dataProduct.name.eval() == 'TempForExport':
            odtk.ProductBuilder.DataProducts.RemoveAt(productCounter)
        productCounter += 1

    # Create a new data product at the end of the list
    new_elem = odtk.ProductBuilder.DataProducts.NewElem()
    odtk.ProductBuilder.DataProducts.push_back(new_elem)
    index = odtk.ProductBuilder.DataProducts.size.eval() - 1
    product = odtk.ProductBuilder.DataProducts[index]
    
    # Configure the the data product
    new_src = product.Inputs.DataSources.NewElem()
    product.Inputs.DataSources.push_back(new_src)
    product.Name.Assign('TempForExport')
    product.Inputs.DataSources[0].Filename = runFilePath
    product.Outputs.Style = style_path
    product.Outputs.Display = False
    product.Outputs.Export.Enabled = True
    product.Outputs.Export.Format = 'CommaSeparated'
    product.Outputs.Export.FileName = str(export_file_path)
    # Create the product
    if not odtk.ProductBuilder.GenerateProduct('TempForExport'):
        raise Exception('GenerateProduct failed. Please check the log for more details.')
    #odtk.ProductBuilder.DataProducts.Clear()
    # parse product
    df = pd.read_csv(str(export_file_path))
    
    # cleanup
    # delete product
    productCounter = 0
    for dataProduct in odtk.ProductBuilder.DataProducts:
        if dataProduct.name.eval() == 'TempForExport':
            odtk.ProductBuilder.DataProducts.RemoveAt(productCounter)
        productCounter += 1

    # delete temp export style
    try:
        Path(style_path).unlink(missing_ok=True)
    except:
        print('cound not delete ' + style_path)

    # delete temp csv data file
    try:
        Path(export_file_path).unlink(missing_ok=True)
    except:
        print('cound not delete ' + export_file_path)

    return df


# run everything
def GetData(odtk, arrayTableAndNames, runPath):
    # create temp .exp file
    tempPath = tempfile.NamedTemporaryFile(delete=False, suffix='.exp')

    # create export style
    SaveExportStyle(arrayTableAndNames, tempPath.name)

    # generate report
    df = GenerateReport(runPath, tempPath.name)

    return df



##### TEST #####
# connect to running instance of odtk
client = Client.create_single_user_client()
odtk = client.get_root()
print('connected to ' + odtk.scenario[0].name.eval())

# test case 1 - report measurements
arrayTableAndNames = ['TrackingData.Date Time', 'TrackingData.Tracker ID', 'TrackingData.Satellite ID', 'TrackingData.Measurement Type', 'TrackingData.Measurement Value', 'TrackingData.Meas Units']
runPath = r'C:\Users\jramrath\Documents\ODTK 7\DataArchive\OdtkExample.simrun'
measurements = GetData(odtk, arrayTableAndNames, runPath)
print(measurements.columns.tolist())

# test case 2 - residual ratios
arrayTableAndNames = ['MeasurementHistory.Date Time', 'MeasurementHistory.Tracker ID', 'MeasurementHistory.Satellite ID', 'MeasurementHistory.Measurement Type', 'MeasurementHistory.Residual Ratio']
runPath = r'C:\Users\jramrath\Documents\ODTK 7\DataArchive\OdtkExample.filrun'
resRatios = GetData(odtk, arrayTableAndNames, runPath)
print(resRatios.columns.tolist())


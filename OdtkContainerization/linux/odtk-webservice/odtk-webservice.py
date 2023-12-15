from flask import Flask, abort, send_file 
from odtk import Client
import matplotlib.pyplot as plt
import pandas as pd
import subprocess

app = Flask(__name__)

odtkProcess = subprocess.Popen(['odtkruntime'], stderr=subprocess.PIPE)
while True:
    if b'ODTK initialized' in odtkProcess.stderr.readline():
        break

client = Client()
root = client.get_root()
root.LoadObject('', '/home/odtk/scenario/Baseline.sco')

root.scenario[0].simulator['Simulator'].Go()

@app.route('/version')
def version_service():
    client = Client()
    root = client.get_root()
    return root.application.appVersion.eval()

@app.route('/satellites/<satName>/process')
def process_simulated_obs(satName):
    client = Client()
    root = client.get_root()
    filter = root.scenario[0].filter['Filter']
    filter.SatelliteList.clear()
    try:
        filter.SatelliteList.InsertByName(satName)
    except:
        abort(404)
    filter.Go()
    root.ProductBuilder.LoadDataProductList('/home/odtk/scenario/Residuals.dpl')
    root.ProductBuilder.GenerateProduct('Residuals')
    data = pd.read_csv('/home/odtk/.ODTK7/DataArchive/ResidualRatios.csv', parse_dates=["Date Time"])
    gb = data.groupby("Measurement Type")
    figure, axs = plt.subplots(4, 1, figsize = (10,12), sharex=True)
    for i, (label, df) in enumerate(gb):
        df.plot.scatter("Date Time", "Residual Ratio", rot=90, ax=axs[i], label=label, title=satName)
    figure.savefig(f'/home/odtk/scenario/ResidualRatios.jpg', format='jpg')
    return send_file('/home/odtk/scenario/ResidualRatios.jpg', download_name='ResidualRatios.jpg')




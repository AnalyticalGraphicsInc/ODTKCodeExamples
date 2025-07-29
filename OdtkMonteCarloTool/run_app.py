import logging
import sys

from odtk_monte_gui.dash_app import DashApp

logger = logging.getLogger("odtk_monte_dash_app")
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler(sys.stdout)
formatter = logging.Formatter("%(asctime)s %(threadName)s %(levelname)-4s %(message)s")
formatter.datefmt = "%Y-%m-%dT%H:%M:%S%z"
handler.setFormatter(formatter)
logger.addHandler(handler)

dash_app = DashApp()
dash_app.run(debug=True)

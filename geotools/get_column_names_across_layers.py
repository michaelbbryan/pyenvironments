#!/usr/bin/env python3
#
# Open the 2019 ACS and collect its layers and column names in each
#

# NOTES:
# 1. The second and third digits of the variable name identify the layer needed from the geodatabase
#          The variable B19003e1 can be found on layer X19_ ...
# 2. EACH ACS Tiger geodatabase includes a layer called "BG_METADATA_2019" for example with a description for each column
#

import fiona
import geopandas as gpd
import pandas as pd
import os
os.environ["GDAL_DATA"] = "C:\\Users\\micha\\anaconda3\\envs\\geotools\\Library\\share\\gdal"
os.environ["GDAL_DRIVER_PATH"] = "C:\\Users\\micha\\anaconda3\\envs\\geotools\\Library\\share\\gdal"
os.environ["PROJ_LIB"] = "C:\\Users\\micha\\anaconda3\\envs\\geotools\\Library\\share\\proj"
os.environ["PROJ_DATA"] = "C:\\Users\\micha\\anaconda3\\envs\\geotools\\Library\\share\\proj"

tigerpath = "D:\\Open Environments\\data\\census\\tiger\\""
tigerfile = tigerpath + "ACS_2019_5YR_BG.gdb\ACS_2019_5YR_BG.gdb"

# loop over each layer and get its columns, so you know which layer holds the variable you want
varlist = []

for layer in fiona.listlayers(tigerfile):
    vardf = pd.DataFrame()
    acs = gpd.read_file(tigerfile,layer=layer)
    vardf["Variable"] = acs.columns
    vardf["Layer"] = layer
    varlist.append(vardf)

gpdvariables = pd.concat(varlist)

gpdvariables.to_pickle("ACS_2019_5YR_BG_variable_layer.pkl")
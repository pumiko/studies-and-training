import arcpy
import numpy as np
from arcpy import env  
from arcpy.sa import *

env.workspace = "path/to/folder"

start_ocean = np.arange(-11000,-9,10)
end_ocean = np.arange(-10990,1,10)
labels = np.arange(11000,0,-10)
array = np.column_stack((start_ocean,end_ocean,labels))
list_reclass_values = array.tolist()

Reclass_etopo_proba = Reclassify("etopo_oceany.tif", "VALUE", RemapRange(list_reclass_values), "NODATA")



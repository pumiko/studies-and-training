#import modules arcpy and string
import arcpy, string, os

#import the environment settings #and spatial analyst extension
from arcpy import env
from arcpy.sa import *

arcpy.env.overwriteOutput = True

#check out the ArcGIS Spatial Analyst extension license
arcpy.CheckOutExtension("Spatial")

#set the workspace and list all images in it
env.workspace = "path/to/dir"
rasterList = arcpy.ListFiles("*.CR2")

for rast in rasterList:
  #specify input and output
  input = rast
  result = "NDVI_" + input[0:(len(input)-4)] + ".tif"
  #print result
  NIR = Raster(input + "\Band_3")
  Red = Raster(input + "\Band_2")
  
  #execute map algebra
  outNDVI = arcpy.sa.Float((NIR - Red))/(arcpy.sa.Float((NIR + Red)))

  #save the output
  outNDVI.save(result)
  
  #Calculate statistics
  arcpy.CalculateStatistics_management(result)
  
  #Reclassify
  outReclass = Reclassify(result, "Value", RemapRange([[-1,-0.00389,"NODATA"],[-0.00389,0.50321,1],[0.50321,1,"NODATA"]]), "NODATA")
  outReclass.save("Reclass_" + result)
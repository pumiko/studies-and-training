library(raster)

path_in = "path/to/input/dir"
path_out = "path/to/output/dir"
setwd(path_in)

for (year in 1981:2012)
{ 
  files_list = list.files(path = path_in, pattern = paste("wrf_RAINNC_", year, sep=""))
    
  for (i in 1:length(files_list)) 
  {
    if ( i == 1 )
    {
      correct_file = raster(files_list[i])
    } else {
      correct_file = raster(files_list[i]) - raster(files_list[i-1])
    }
    writeRaster(correct_file, paste(path_out,"/",files_list[i],sep=""), format="GTiff")  
  }
}
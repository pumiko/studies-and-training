library(gdalUtils)
library(raster)

setwd("input/directory/")
pliki_tif = list.files("input/directory/", pattern="*.tif")

for (plik in pliki_tif)
{
        raster = raster(plik)
        raster_flip = flip(raster,'y')
        if (grepl(pattern="T2_*", plik) || grepl(pattern="TSK_*", plik))
        {
          raster_flip = raster_flip - 273.15
        }

        xmin(raster_flip) <- -187529.037909
        xmax(raster_flip) <- 787623.611599
        ymin(raster_flip) <- -810128.856555
        ymax(raster_flip) <- 120017.861227
        crs(raster_flip)  <- "+proj=lcc +lat_1=54.092 +lat_2=54.092 +lat_0=54.092 +lon_0=15.536 +a=6370000.0 +b=6370000.0 +units=m +no_defs +x_0=0 +y_0=0"
        
        dst_dataset=paste("/input/directory/","wrf_",plik,sep="")
        writeRaster(raster_flip, dst_dataset, format="GTiff",overwrite=TRUE)
        file.remove(paste("input/directory/",plik,sep=""))
}

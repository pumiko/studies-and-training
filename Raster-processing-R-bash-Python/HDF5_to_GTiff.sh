#!/bin/bash
#PBS -l nodes=2

path_wrf="input/directory"
path_out="output/directory"
f_name="wrfout_d03_"
t_name="_00:00:00"

#year=1981

for (( year=1981; year<=2012; year++))
do
    path_wrf_year="${path_wrf}shaved"${year}"/"
	year_plus=`expr $year + 1`
    now=`date +"%Y/%m/%d" -d "01/01/${year}"`
    end=`date +"%Y/%m/%d" -d "01/01/${year_plus}"`

    while [ "$now" != "$end" ]
    do
    now_2=`date +"%Y-%m-%d" -d "$now"`

        for (( i=1; i<=8; i++ ))
        do
            gdal_translate -of GTiff -b ${i} "HDF5:\"${path_wrf_year}${f_name}${now_2}${t_name}\"://T2" "${path_out}T2_${now_2}_${i}.tif"
            gdal_translate -of GTiff -b ${i} "HDF5:\"${path_wrf_year}${f_name}${now_2}${t_name}\"://TSK" "${path_out}TSK_${now_2}_${i}.tif"
            #gdal_translate -of GTiff -b ${i} "HDF5:\"${path_wrf_year}${f_name}${now_2}${t_name}\"://RAINC" "${path_out}RAINC_${now_2}_${i}.tif"
        done

    now=`date +"%Y/%m/%d" -d "$now + 1 day"`
    done

done

SELECT ST_MakePolygon ( ST_GeomFromText ( 'LINESTRING(' || ST_X (geom) || ' ' || ST_Y (geom) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth + 50))|| ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth + 50)) || ',
	' || ST_X (geom) + 0.004  *sin(radians(azimuth + 40))|| ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth + 40)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth + 30))|| ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth + 30)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth + 20)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth + 20)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth + 10)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth + 10)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth))  || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth - 10)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth - 10)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth - 20)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth - 20)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth - 30)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth - 30)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth - 40)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth - 40)) || ', 
	' || ST_X (geom) + 0.004  *sin(radians(azimuth - 50)) || ' ' || ST_Y (geom) + 0.004  *cos(radians(azimuth - 50)) || ', 
	' || ST_X (geom) || ' ' || ST_Y (geom) || ')', 4326)) as geom_pie from observer_points
	
	

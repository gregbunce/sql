-- this returns records where there’s issues between the LRS and the Road Centerlines
select * from UTRANS.TRANSADMIN.ROADS_EDIT where (DOT_F_MILE IS NULL AND DOT_T_MILE IS NULL) AND (DOT_RTNAME LIKE '0%' AND LEN(DOT_RTNAME) = 5)

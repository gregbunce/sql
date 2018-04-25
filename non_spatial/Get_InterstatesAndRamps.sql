-- this sql query can run in ArcMap
(ONEWAY = 1 and DOT_F_MILE < DOT_T_MILE and DOT_RTNAME like '0%' and DOT_RTNAME like '%P%' and not DOT_RTNAME is null) 
or 
(ONEWAY = 2 and DOT_F_MILE < DOT_T_MILE and DOT_RTNAME like '0%' and DOT_RTNAME like '%N%' and not DOT_RTNAME is null) 

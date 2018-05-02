-- these sql queries can run in ArcMap

-- return all interstates and ramps
DOT_RTNAME like '0%' and (DOT_RTNAME like '%N%' or DOT_RTNAME like '%P%') and ONEWAY in (1, 2)

-- return all interstates (not ramps that have the correct oneway and milepost assignments
(ONEWAY = 1 and DOT_F_MILE < DOT_T_MILE and DOT_RTNAME like '0%' and DOT_RTNAME like '%P%' and not DOT_RTNAME is null) 
or 
(ONEWAY = 2 and DOT_F_MILE < DOT_T_MILE and DOT_RTNAME like '0%' and DOT_RTNAME like '%N%' and not DOT_RTNAME is null) 

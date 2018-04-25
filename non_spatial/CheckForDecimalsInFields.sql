-- check for decimals in field - and see count by county cofips
select count(COFIPS), COFIPS as County from 
(select * from SGID10.Transportation.ROADS where L_F_ADD <> CAST(L_F_ADD as int) or
L_T_ADD <> CAST(L_T_ADD as int) or
R_F_ADD <> CAST(R_F_ADD as int) or
R_T_ADD <> CAST(R_T_ADD as int)) as a
group by a.COFIPS


-- check for decimals in address range fields fields
select * from SGID10.Transportation.ROADS where L_F_ADD <> CAST(L_F_ADD as int) or
L_T_ADD <> CAST(L_T_ADD as int) or
R_F_ADD <> CAST(R_F_ADD as int) or
R_T_ADD <> CAST(R_T_ADD as int)


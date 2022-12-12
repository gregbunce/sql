-- use this script to get the newest roads in the sgid roads feature class.
declare @twoweeksago datetime
declare @now datetime
set @now = GETDATE()
set @twoweeksago = DATEADD(day, -14, @now) 

select FROMADDR_L, FROMADDR_R, PREDIR, FULLNAME, ADDRSYS_L, ZIPCODE_L  from Transportation.ROADS r 
where CREATED between @twoweeksago and @now 

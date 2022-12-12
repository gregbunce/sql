-- use this script to get the newest roads in the sgid roads feature class.

declare @twoweeksago datetime
declare @now datetime
set @now = GETDATE()
set @twoweeksago = DATEADD(day, -14, @now) 

select r.FROMADDR_L, r.TOADDR_L, MID_RANGE_NUMBER = (select mid = ((r.FROMADDR_L + r.TOADDR_L))/2), r.PREDIR, r.FULLNAME, r.ADDRSYS_L, r.ZIPCODE_L, r.CREATED from Transportation.ROADS r 
where CREATED between @twoweeksago and @now

-- joining data and returning rows that do not match

-- JOIN NOT MATCHED 
-- get rows that did not match(join)
select a.*
from (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID,(ltrim(rtrim(AddSystem)) + ' | ' + ltrim(rtrim(AddNum)) + ' ' + ltrim(rtrim(PrefixDir)) + ' ' + ltrim(rtrim(StreetName)) + ' ' + ltrim(rtrim(StreetType + ' ' + ltrim(rtrim(SuffixDir)))))UTAddPtID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = ‘SALT LAKE CITY’) a
	where NOT EXISTS
	(
		select null
		from LOCATION.ADDRESSPOINTS b
		where a.AddSystem = b.AddSystem
		and a.StreetName = b.StreetName
		and a.AddNum = b.AddNum
		and a.StreetType = b.StreetType
		and a.SuffixDir = b.SuffixDir
		and a.AddNumSuffix = b.AddNumSuffix
		and a.PrefixDir <> b.PrefixDir
	)


select a.*
from (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = 'SALT LAKE CITY') a
where NOT EXISTS
	(
		select null
		from LOCATION.ADDRESSPOINTS b
		where a.AddSystem = b.AddSystem
		and a.StreetName = b.StreetName
		and a.AddNum = b.AddNum
		and a.StreetType = b.StreetType
		and a.SuffixDir = b.SuffixDir
		and a.AddNumSuffix = b.AddNumSuffix
		and a.PrefixDir <> b.PrefixDir
	)


-- JOIN MATCH 
-- same query as above, but getting rows that did match the join (the number returned here plus the number returned above should equal the number from the subquery for table a)
SELECT a.AddNum, a.AddNumSuffix, a.PrefixDir, b.PrefixDir, a.StreetName, a.StreetType, a.SuffixDir, a.City, a.ZipCode, a.CountyID, a.UTAddPtID
from (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID,(ltrim(rtrim(AddSystem)) + ' | ' + ltrim(rtrim(AddNum)) + ' ' + ltrim(rtrim(PrefixDir)) + ' ' + ltrim(rtrim(StreetName)) + ' ' + ltrim(rtrim(StreetType + ' ' + ltrim(rtrim(SuffixDir)))))UTAddPtID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = 'SALT LAKE CITY')  a, (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = 'SALT LAKE CITY') b
where a.AddSystem = b.AddSystem
and a.StreetName = b.StreetName
and a.AddNum = b.AddNum
and a.StreetType = b.StreetType
and a.SuffixDir = b.SuffixDir
and a.AddNumSuffix = b.AddNumSuffix
and a.PrefixDir <> b.PrefixDir


SELECT a.AddNum, a.AddNumSuffix, a.PrefixDir, b.PrefixDir, a.StreetName, a.StreetType, a.SuffixDir, a.City, a.ZipCode, a.CountyID
from (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = 'SALT LAKE CITY')  a, (SELECT DISTINCT AddSystem,AddNum,AddNumSuffix,PrefixDir,StreetName,StreetType,SuffixDir,City,ZipCode,CountyID FROM LOCATION.ADDRESSPOINTS WHERE PrefixDir <> '' AND StreetName LIKE '%[A-Z]%' AND StreetName NOT LIKE 'HIGHWAY %' AND AddSystem = 'SALT LAKE CITY') b
where a.AddSystem = b.AddSystem
and a.StreetName = b.StreetName
and a.AddNum = b.AddNum
and a.StreetType = b.StreetType
and a.SuffixDir = b.SuffixDir
and a.AddNumSuffix = b.AddNumSuffix
and a.PrefixDir <> b.PrefixDir


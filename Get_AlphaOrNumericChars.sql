-- return alpha and numeric characters
WHERE whatever NOT LIKE '%[a-z0-9]%'

-- return alpha characters
LIKE '%[a-z]%' 

-- return numeric characters
LIKE '%[0-9]%'

-- a few sql queries to run stats on the push (mainly for the website post)
-- the records returned will be from the default version of the database (not the edit version)
-- you may want to compress the database before you run these queries - to see the current state

--STATEWIDESTREETS
-- get the counties that we here in agrc have edited for this past update
select count(EDITOR) AS COUNT, EDITOR, COFIPS from UTRANS.TRANSADMIN.STATEWIDESTREETS
where MODIFYDATE >= '01/10/2017'
and EDITOR in ('GBUNCE', 'MICHAELFOULGER', 'DBUELL')
group by EDITOR, COFIPS
HAVING COUNT(EDITOR) > 5
order by COFIPS

--DFC_RESULTS
select COFIPS,EDITOR from UTRANS.TRANSADMIN.DFC_RESULT
where EDIT_DATE >= '01/10/2017' and CURRENT_NOTES = 'COMPLETED'
GROUP BY COFIPS, EDITOR

--STATEWIDESTREETS - see when a county was last edited - by month
-- get an edit count my month and user(editor)
select
 FORMAT(MODIFYDATE, 'yyyy_MM') AS Edit_Month
 , count(*) EDIT_COUNT, EDITOR
FROM
 UTRANS.TRANSADMIN.STATEWIDESTREETS
WHERE
 (MODIFYDATE >= '01/01/2016' AND MODIFYDATE <= '01/10/2017')
 AND COFIPS = '49051'
 AND EDITOR <> 'UDOT_EDIT'
GROUP BY FORMAT(MODIFYDATE, 'yyyy_MM'),EDITOR
HAVING count(*) > 5
ORDER BY Edit_Month desc

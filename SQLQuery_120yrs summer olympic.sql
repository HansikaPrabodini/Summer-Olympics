USE [olympics1]
GO

SELECT [ID]
      ,[Name]
      ,[Sex]
      ,[Age]
      ,[Height]
      ,[Weight]
      ,[Team]
      ,[NOC]
      ,[Games]
      ,[Year]
      ,[Season]
      ,[City]
      ,[Sport]
      ,[Event]
      ,[Medal]
  FROM [dbo].[athlete_events$]

GO


--create copy of this 
select *
into otz_01
from [athlete_events$]


-- 
select *
from otz_01


---- only want summer olympics 
select *
from otz_01
where Season ='Summer'



--get that in another table 

select *
into otz_02
from otz_01
where Season ='Summer'



--
select *
from otz_02



--now get only medal winners 
select *
into otz_03
from otz_02
where Medal ='Gold'
or Medal ='Silver'
or Medal ='Bronze'



select *
from otz_03



--- 
select *
from otz_03
where Year ='2016'
and NOC ='USA'


--want delete duplicate 
select *
into otz_04
from otz_03

select *
from otz_04

-- use CTE for that - get duplicates
with get_duplicate as(
select 
row_number() over (partition by  Team , Year,Sport,Event,NOC,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from otz_04
)
select *
from get_duplicate
where row_num > 1





with get_duplicate as(
select 
row_number() over (partition by  Team , Year,Sport,Event,NOC,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from otz_04
)
delete
from get_duplicate
where row_num > 1


select *
from otz_04


select *
from otz_04
where Year ='2016'
and NOC ='USA'


--  get medal list - 2020
select NOC , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from otz_04
where Year ='2012'
group by NOC
order by 2 desc






select *
from otz_04
where Team ='United States/Great Britain'


select *
into otz_05
from otz_04

----need to update countries 

--update otz_05
--set Country = 'Republic of Korea'
--where Team ='Bohemia'


--- check distinct count of NOC 
select distinct NOC
from otz_05

select *
from otz_05

SELECT Team, COUNT(DISTINCT NOC) AS NOC_Count
FROM otz_05
GROUP BY Team
HAVING COUNT(DISTINCT NOC) > 1





select *
from otz_05
where Team like '%China%'


update otz_05
set Team = 'Hong Kong'
where Team like '%Hong Kong%'


----------in here want add another country column , for proper location purpose and country code 

select *
from otz_05

alter table otz_05
add Country varchar(255)

update otz_05
set Country = 'Finland'
where NOC = 'FIN'


------update countries 
-- all in country update SQL file 































































































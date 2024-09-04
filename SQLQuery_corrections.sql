USE [olympics]

select *
into olympics_corrections
from olympics_medals_06

select *
from olympics_medals_06
where Sport ='Basketball'

update olympics_medals_06
set Discipline = '3x3 Basketball'
where Sport = 'Basketball'
and discipline_title ='3x3 Basketball'
and Event is null

select *
into olympics_corrections
from olympics_medals_06

select *
from olympics_corrections

--- want rename this columns same as olympics_76_05 
--athlete_full_name - Athlete
EXEC sp_rename 'olympics_corrections.athlete_full_name', 'Athlete', 'COLUMN'
--C_code - Country_Code 
EXEC sp_rename 'olympics_corrections.country_3_letter_code', 'Country_Code', 'COLUMN'
--country_name - Country
EXEC sp_rename 'olympics_corrections.country_name', 'Country', 'COLUMN'
--E_gender - Event_gender
EXEC sp_rename 'olympics_corrections.event_gender', 'Event_gender', 'COLUMN'
--syntax 
--EXEC sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';


select *
from olympics_corrections

alter table olympics_corrections
drop column Event


EXEC sp_rename 'olympics_corrections.event_title', 'Event', 'COLUMN'

EXEC sp_rename 'olympics_corrections.medal_type', 'Medal', 'COLUMN'



UPDATE olympics_corrections
SET Medal = upper(left(Medal, 1)) + lower(substring(Medal, 2, len(Medal)))



---add another copy of this file 
select *
into olympics_corrections_01
from olympics_corrections


select *
from olympics_corrections_01



alter table olympics_corrections_01
drop column discipline_title , slug_game , athlete_url , country_code 

alter table olympics_corrections_01
drop column participant_type , participant_title


EXEC sp_rename 'olympics_corrections_01.country_3_letter_code', 'Country_Code', 'COLUMN'



----update event gender

select distinct Event_gender
from olympics_corrections_01


update olympics_corrections_01
set Event_gender ='W'
where Event_gender = 'Women'



update olympics_corrections_01
set Event_gender ='M'
where Event_gender = 'Men'

update olympics_corrections_01
set Event_gender ='X'
where Event_gender = 'Open'
or Event_gender = 'Mixed'


---
select *
from olympics_corrections_01

SELECT City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal
INTO c1
FROM olympics_corrections_01

UNION 

SELECT City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal
FROM olympics_76_05


---
select *
from c1


select *
into c2
from c1

-- use CTE for that - get duplicates
with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from c2
)
select *
from get_duplicate
where row_num > 1



with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from c2
)
delete
from get_duplicate
where row_num > 1



select *
from c2



select *
from c2
where Year = '2020'
and Discipline ='Athletics'
and Event ='100m'
and Event_gender ='M'


select *
from c2
where Discipline ='Athletics'



alter table c2 
add event_test varchar(255)

update c2
set event_test = Event


--
select *
from c2


UPDATE c2
SET event_test = REPLACE(REPLACE(REPLACE(REPLACE(event_test, 'Men''s', ''), 'Women''s', ''), 'Men', ''), 'Women', '')
WHERE event_test LIKE '%Men%' OR event_test LIKE '%Women%' OR event_test LIKE '%Men''s%' OR event_test LIKE '%Women''s%';


UPDATE c2
SET event_test = REPLACE(REPLACE(event_test, 'Wo', ''), 'wo', '')
WHERE event_test LIKE '%Wo%' OR event_test LIKE '%wo%';





select *
from c2
where event_test =''




update c2 
set event_test ='Event'
where event_test =''




select *
from c2
where Year = '2020'
and Discipline ='Athletics'
and event_test ='100m'
and Event_gender ='M'

--use trim 
UPDATE c2
SET event_test = LTRIM(RTRIM(event_test))


select *
from c2
where Discipline ='Swimming'
and event_test ='100m freestyle'
and Event_gender ='M'
order by Year desc

----------now need to added this annulled results 
------- first check for annulled results 

-- counts event with all 3 medals 

select City,Year,Sport, Discipline, event_test,Event_gender, count(distinct Medal) as Medal_Count
from  c2
group by City, Year, Sport, Discipline, event_test ,Event_gender
having count(distinct Medal) = 3

--count event without all 3 medals   
select City,Year,Sport, Discipline, event_test,Event_gender, count(distinct Medal) as Medal_Count
from  c2
group by City, Year, Sport, Discipline, event_test,Event_gender
having count(distinct Medal) < 3  
--38 rows 


--get copy of table 
select *
into c3
from c2

select *
from c3



--there are some possibilty in the Olympics where athletes or teams share medals
-- it also include in this query 
-- like 2020 high jump

-- now i want to check how many events without Gold medal - all are can assume annulled
-- some of them updated 
-- some of them not 

-- case 01 - Gold
-- Identify Events Without a Gold Medal
select City,Year,Sport, Discipline, event_test,Event_gender, count(distinct Medal) as Medal_Count
from  c3
group by City, Year, Sport, Discipline, event_test,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Gold' then 1 else 0 end ) = 0
-- then only got 3 rows 


-------------------------------------- need to update this 
-------------------------------------- 01 - 2000 - 4x400m relay - men
select *
from c3
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and event_test ='4x400m relay'
and Event_gender ='M'

-- in here want to update  silver - Gold , Bronze - Silver , add Bahamas to Bronze

update c3
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and event_test ='4x400m relay'
and Event_gender ='M'


--and add bahamas as broze
insert into c3 (City,Year, Sport, Discipline,Country_Code, Country,Event_gender, Medal , event_test)
values ('Sydney','2000', 'Athletics', 'Athletics','BAH', 'Bahamas','M', 'Bronze', '4x400m relay')


-------------------------------------- 02 - Sydney	2000	Athletics	Athletics	100m	women
-- its updated

-------------------------------------- 03 - London	2012	Weightlifting	Weightlifting	105kg heavyweight men	
select *
from c3
where Year = '2012'
and Sport = 'Weightlifting'
and Discipline ='Weightlifting'
and event_test ='105kg heavyweight'
and Event_gender ='M'



update c3
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2012'
and Sport = 'Weightlifting'
and Discipline ='Weightlifting'
and event_test ='105kg heavyweight'
and Event_gender ='M'

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Weightlifting', 'Weightlifting', '105kg heavyweight','Ivan EFREMOV', 'UZB', 'Uzbekistan','M', 'Bronze')



-- case 02 - Silver
-- Identify Events Without a Silver Medal
select City,Year,Sport, Discipline, event_test,Event_gender, count(distinct Medal) as Medal_Count
from  c3
group by City, Year, Sport, Discipline, event_test,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Silver' then 1 else 0 end ) = 0
-- 19 rows 
-- there are some possibility they share medals 

--01---------------
select *
from c3
where Year = '2004'
and Sport = 'Tennis'
and Discipline ='Tennis'
and event_test ='doubles'
and Event_gender ='W'

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Athens','2004', 'Tennis', 'Tennis', 'doubles','vivi RUANO', 'ESP', 'Spain','W', 'Silver')

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Athens','2004', 'Tennis', 'Tennis', 'doubles','Conchita MARTINEZ', 'ESP', 'Spain','W', 'Silver')


------02------------------------------------------
select *
from c3
where Year = '2008'
and Sport = 'Cycling'
and Discipline ='Cycling Road'
and event_test ='individual road race'
and Event_gender ='M'

update c3
set Medal = case 
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2008'
and Sport = 'Cycling'
and Discipline ='Cycling Road'
and event_test ='individual road race'
and Event_gender ='M'

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Cycling', 'Cycling Road', 'individual road race','Alexandr KOLOBNEV', 'RUS', 'Russia','M', 'Bronze')


---- 03 ----------------------------------------------
select *
from c3
where Year = '2012'
and Sport = 'Athletics'
and Discipline ='Athletics'
and event_test ='1500m'
and Event_gender ='W'

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '1500m','Tatyana TOMASHOVA', 'RUS', 'Russia','W', 'Silver')

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '1500m','Abeba AREGAWI', 'ETH', 'Ethiopia','W', 'Bronze')



-- case 03 - Bronze
-- Identify Events Without a Bronze Medal
select City,Year,Sport, Discipline, event_test,Event_gender, count(distinct Medal) as Medal_Count
from  c3
group by City, Year, Sport, Discipline, event_test,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Bronze' then 1 else 0 end ) = 0
-- 18 rows 
-- there are some possibility they share medals 

-- 01-------------------------------
select *
from c3
where Year = '2012'
and Sport = 'Athletics'
and Discipline ='Athletics'
and event_test ='800m'
and Event_gender ='W'

insert into c3 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '800m','Pamela JELIMO', 'KEN', 'Kenya','W', 'Bronze')


----
select *
from c3
where Year = '2016'
and Sport = 'Aquatics'
and Discipline ='Swimming'
and event_test ='100m butterfly'
and Event_gender ='M'


---- in this way can check medal was shared 
--select City,Year,Sport, Discipline, Event,Event_gender, count(Athlete) as Medal_Share_Count
--from  combined_olympics_medals_03
--group by City, Year, Sport, Discipline, Event,Event_gender
--having count(Athlete) > 1 



-- get rid of copies in memeber teams 
select *
into c4
from c3



-- use CTE for that - get duplicates
with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,event_test,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from c4
)
select *
from get_duplicate
where row_num > 1


with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,event_test,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from c4
)
delete
from get_duplicate
where row_num > 1


-----------------------
select *
from c4 



---------------


select *
from c4
where Year = '2020'
and Country_Code = 'CHN'
and Medal ='Bronze'


select *
from c4
where Year = '2020'
and Country_Code = 'CHN'
and Discipline ='Athletics'




select *
from c4
where Year = '2020'
and Country_Code = 'GBR'
and Medal ='Silver'
and Discipline ='Athletics'

--------------
--wrongly uploaded 
select *
into c5
from c4
--
-- in 2020 4 x 100m Relay - bronze CHN , silver -CAN , no medal for GBR

select *
from c5
where Year = '2020'
and event_test ='4 x 100m Relay'
and Event_gender ='M'
and Country_Code = 'GBR'

update c5
set Medal = case 
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2020'
and event_test ='4 x 100m Relay'
and Event_gender ='M'




insert into c5 (City, Year,Sport, Discipline, event_test, Country_Code, Country,Event_gender, Medal)
values ('Tokyo','2020', 'Athletics', 'Athletics', '4 x 100m Relay', 'CHN', 'China','M', 'Bronze')


--delete that recode 
delete
from c5
where Year = '2020'
and event_test ='4 x 100m Relay'
and Event_gender ='M'
and Country_Code = 'GBR'


-----------------------------------------------

--  get medal list - 2020
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2020'
group by Country_Code
order by 2 desc




--  get medal list - 2016
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2016'
group by Country_Code
order by 2 desc


--  get medal list - 2012
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2012'
group by Country_Code
order by 2 desc

----need to update - miss 20km W walk
select *
from c5
where Year = '2012'
and Country_Code ='CHN'
and Medal='Gold'
and Sport='Athletics'

select *
from c5
where Year = '2012'
and Sport='Athletics'
and event_test ='20km race walk'

update c5
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2012'
and event_test ='20km race walk'
and Event_gender ='W'


insert into c5 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '20km race walk','xiuzhi LU', 'CHN', 'China','W', 'Bronze')

--delete RUS record 
delete
from c5
where Year = '2012'
and Country_Code ='RUS'
and Medal='Gold'
and event_test ='20km race walk'


--still RUS medal count not correct - 2012 , 400m hurdles W
select *
from c5
where Year = '2012'
and event_test ='400m hurdles'
and Event_gender ='W'
and Medal='Gold'
and Country_Code ='RUS'

update c5
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2012'
and event_test ='400m hurdles'
and Event_gender ='W'


insert into c5 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '400m hurdles','kaliese spencer
', 'JAM', 'Jamaica','W', 'Bronze')

--delete RUS record 
delete
from c5
where Year = '2012'
and Country_Code ='RUS'
and Medal='Gold'
and event_test ='400m hurdles'




------------ still had another bronze

select *
from c5
where Year = '2012'

and event_test ='105kg superheavyweight'
and Event_gender ='M'
and Country_Code ='RUS'
and Medal='Bronze'

insert into c5 (City, Year,Sport, Discipline, event_test,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Weightlifting', 'Weightlifting', '105kg superheavyweight','sang-guen jeon', 'KOR', 'South Korea','M', 'Bronze')

--delete RUS record 
delete
from c5
where Year = '2012'
and event_test ='105kg superheavyweight'
and Event_gender ='M'
and Country_Code ='RUS'
and Medal='Bronze'

-------------------------------------------------------------------------------------


--  get medal list - 2012
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2012'
group by Country_Code
order by 2 desc


--  get medal list - 2008
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2008'
group by Country_Code
order by 2 desc


-- need to correct Russia records 

select *
from c5
where Year = '2008'
and Country_Code ='RUS'
and Medal='Gold'
and event_test ='105kg superheavyweight'
and Event_gender ='M'

select *
from c5
where Year = '2008'
and Discipline = 'Athletics'
and event_test ='4x100m relay'
and Event_gender='W'
and Country_Code ='RUS'
and Medal='Gold'

---need to update it 
update c5
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2008'
and event_test ='4x100m relay'
and Event_gender ='W'


insert into c5 (City, Year,Sport, Discipline, event_test, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Athletics', 'Athletics', '4x100m relay', 'BRA', 'Brazil ','W', 'Bronze')


--delete RUS record 
delete
from c5
where Year = '2008'
and Discipline = 'Athletics'
and event_test ='4x100m relay'
and Event_gender='W'
and Country_Code ='RUS'
and Medal='Gold'



----------add two gold medals ----------------------01
select *
from c5
where Year = '2008'
and Discipline = 'Weightlifting'
and event_test ='69kg'
and Event_gender='W'
and Country_Code ='RUS'
and Medal='Gold'

update c5
set Medal = case 
when Medal = 'Silver' then 'Gold'
else Medal
end 
where Year = '2008'
and Discipline = 'Weightlifting'
and event_test ='69kg'
and Event_gender='W'


insert into c5 (City, Year,Sport, Discipline, event_test, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Weightlifting', 'Weightlifting', '69kg', 'COL', 'Colombia ','W', 'Silver')

insert into c5 (City, Year,Sport, Discipline, event_test, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Weightlifting', 'Weightlifting', '69kg', 'EGY', 'Egypt ','W', 'Bronze')

delete
from c5
where Year = '2008'
and Discipline = 'Weightlifting'
and event_test ='69kg'
and Event_gender='W'
and (Country_Code ='UKR' or Country_Code ='CHN')

-------------------------------02 

select *
from c5
where Year = '2008'
and Discipline = 'Wrestling Free'
and event_test ='96 - 120kg'

update c5
set Medal = case 
when Medal = 'Silver' then 'Gold'
else Medal
end 
where Year = '2008'
and Discipline = 'Wrestling Free'
and event_test ='96 - 120kg'


update c5
set Medal = case 
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2008'
and Discipline = 'Wrestling Free'
and event_test ='96 - 120kg'
and Country_Code = 'SVK'

insert into c5 (City, Year,Sport, Discipline, event_test, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Wrestling', 'Wrestling Free', '96 - 120kg', 'CUB', 'Cuba ','M', 'Bronze')


delete
from c5
where Year = '2008'
and Discipline = 'Wrestling Free'
and event_test ='96 - 120kg'
and Event_gender='M'
and Country_Code ='UZB' 

--------------------------------------------------------------------------------------


--  get medal list - 2008
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2008'
group by Country_Code
order by 2 desc




----------------

--  get medal list - 2004
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from c5
where Year ='2004'
group by Country_Code
order by 2 desc





--- there is lot or recorrection need 
-- so use this table for further calculations 
-- did web scrape after taht get corrected one 

select *
from c5




--get total medal count by year ( olympic year) - use CTE
with get_total_medal_count as(
select 
count(*) as Total_medals,
Year 

from c5
group by Year
)
select Year, Total_medals
from get_total_medal_count
-------------------------------------------
--------------------------------------------------------
--------------------------------

------------ need to check country 
select *
into c6
from c5

select distinct Country 
from c6

select *
from c6
where Country like '%United States%'



--update United States of America
update c6
set Country = 'United States of America'
where Country like '%United States%'



select distinct Country 
from c6

--Netherlands Antilles* , Netherlands
select *
from c6
where Country like '%Netherlands%'

update c6
set Country = 'Netherlands'
where Country like '%Netherlands%'


---------------------------------------
select *
from c6
where Country like '%Korea%'

--PRK -Korea, North, Democratic People's Republic of Korea
--KOR - Korea, South , Republic of Korea

update c6
set Country = 'Republic of Korea'
where Country_Code = 'KOR'


update c6
set Country = 'Democratic People''s Republic of Korea'
where Country_Code = 'PRK'


---------------------------------Cote d'Ivoire,CÃ´te d'Ivoire
--The IOC country code CIV represents Côte d'Ivoire, commonly known as the Ivory Coast
select *
from c6
where Country like '%CÃ´te d''Ivoire%'

select *
from c6
where Country_Code = 'CIV'

update c6
set Country = 'Côte d''Ivoire'
where Country_Code = 'CIV'


------------------------------------------China , People's Republic of China
--The IOC country code CHN represents China.
select *
from c6
where Country like '%China%'

select *
from c6
where Country_Code = 'CHN'

update c6
set Country = 'China'
where Country_Code = 'CHN'

----------------------------------------------------------Bermuda , Bermuda*--BER
update c6
set Country = 'Bermuda'
where Country_Code = 'BER'


--------------------------------------------------Hong Kong* , Hong Kong, China-HKG

update c6
set Country = 'Hong Kong'
where Country_Code = 'HKG'

-----------------------------------------------Iran , Islamic Republic of Iran - IRI
update c6
set Country = 'Islamic Republic of Iran'
where Country_Code = 'IRI'

----------------------------------------------Moldova , Republic of Moldova - MDA
update c6
set Country = 'Moldova'
where Country_Code = 'MDA'

-----------------------------------------------Macedonia , North Macedonia - MKD 
update c6
set Country = 'Macedonia'
where Country_Code = 'MKD'

------------------------------------------------Puerto Rico , Puerto Rico* - PUR
update c6
set Country = 'Puerto Rico'
where Country_Code = 'PUR'


---------------------------------------------Russia , Russian Federation - RUS 
update c6
set Country = 'Russia'
where Country_Code = 'RUS'


---------------------------------------------Syria , Syrian Arab Republic - SYR 
update c6
set Country = 'Syria'
where Country_Code = 'SYR'

--------------------------------------------Chinese Taipei , Taiwan - TPE 
update c6
set Country = 'Taiwan(Chinese Taipei)'
where Country_Code = 'TPE'


--------------------------------------------Great Britain , United Kingdom - GBR
update c6
set Country = 'Great Britain'
where Country_Code = 'GBR'


select Country_Code , Country
from c6
group by Country_Code , Country



select distinct Country 
from c6


select distinct Country_Code 
from c6

--------------Trinidad and Tobago -TRI , TTO 
-- TRI is not an official IOC code for Trinidad and Tobago; TTO is the correct and recognized code.
update c6
set Country_Code = 'TTO'
where Country = 'Trinidad and Tobago'


----------------Netherlands - AHO , NED
--NED is the official and current IOC code for the Netherlands.
--AHO was used for the Netherlands Antilles, which no longer exists as a political entity, so it is no longer in use. Therefore, only NED is relevant for the Netherlands in the Olympics today.

update c6
set Country_Code = 'NED'
where Country = 'Netherlands'


--------------- Singapore - SGP , SIN 
--SGP is the correct and current IOC country code for Singapore.
update c6
set Country_Code = 'SGP'
where Country = 'Singapore'
--------------


--get country still had two codes 
SELECT Country, COUNT(DISTINCT Country_Code) AS Code_Count
FROM c6
GROUP BY Country
HAVING COUNT(DISTINCT Country_Code) > 1;


select Country_Code , Country
from c6
where Country = 'Serbia'


------Serbia - SRB , SCG 
--SRB is the current IOC country code for Serbia.
update c6
set Country_Code = 'SRB'
where Country = 'Serbia'




----------------
-- need to drop Event and Athlete column 


select *
from c6


--- now want all rows of event list get in lower cases 

select lower(event_test)
from c6

update c6
set event_test = lower(event_test)



--- get another copy and drop athlete 
select *
into c7
from c6

alter table c7
drop column Athlete


select *
from c7

---check for race walk and walk 
-- need to update it 

select *
from c7
where event_test like '%20km%'


--need to update it 
update c7
set event_test = '20km walk' 
where event_test like '%20km%'
and Discipline ='Athletics'

---now all clear 



---get another copy of file - for only 2020 olympics

select *
into tokyo
from c7
where Year ='2020'



select *
from tokyo 



alter table tokyo
add Host_Country varchar(255)

update tokyo
set Host_Country ='Japan'


select Year , City , Sport ,Event_test ,Medal ,Country , Country_Code ,Event_gender , Host_Country
into tokyo_1
from tokyo

select *
from tokyo_1


---rename Event_test to Event 
EXEC sp_rename 'tokyo_1.Event_test', 'Event', 'COLUMN'




--- need to change 
update tokyo_1
set Country = 'United States'
where Country ='United States of America'


update tokyo_1
set Country = 'United Kingdom'
where Country ='Great Britain'



update tokyo_1
set Country = 'South Korea'
where Country ='Republic of Korea'




































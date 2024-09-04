
-- This is for combined table EDA 
-- want to sure data is correct 
-- use combined_olympics_medals_02 table for this 

Use olympics

select *
from combined_olympics_medals_02
where Year = '2020'
and Event ='100m'
and Event_gender ='M'


select *
from combined_olympics_medals_02


select *
from combined_olympics_medals_02
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='4x400m relay'
and Event_gender ='M'


----------now need to added this annulled results 
------- first check for annulled results 


-- counts event with all 3 medals 

select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals
group by City, Year, Sport, Discipline, Event ,Event_gender
having count(distinct Medal) = 3
    
--count event without all 3 medals   
select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals
group by City, Year, Sport, Discipline, Event,Event_gender
having count(distinct Medal) < 3   
-- 38 rows     


select *
from combined_olympics_medals_02
where Event_gender is NULL

-- now need to update this annulled 
-- create copy of this table 
select *
into combined_olympics_medals_03
from combined_olympics_medals_02

select *
from combined_olympics_medals_03

select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals_03
group by City, Year, Sport, Discipline, Event,Event_gender
having count(distinct Medal) < 3 

--there are some possibilty in the Olympics where athletes or teams share medals
-- it also include in this query 
-- like 2020 high jump

-- now i want to check how many events without Gold medal - all are can assume annulled
-- some of them updated 
-- some of them not 

-- case 01 - Gold
-- Identify Events Without a Gold Medal
select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals_03
group by City, Year, Sport, Discipline, Event,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Gold' then 1 else 0 end ) = 0
-- then only got 3 rows 


-------------------------------------- need to update this 
-------------------------------------- 01 - 2000 - 4x400m relay - men
select *
from combined_olympics_medals_03
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='4x400m relay'
and Event_gender ='M'

-- in here want to update  silver - Gold , Bronze - Silver , add Bahamas to Bronze

update combined_olympics_medals_03
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='4x400m relay'
and Event_gender ='M'


--and add bahamas as broze
insert into combined_olympics_medals_03 (City, Sport, Discipline, Event,Country_Code,  Country,Event_gender, Medal)
values ('Sydney','2000', 'Athletics', 'Athletics', '4x400m relay', 'BAH', 'Bahamas','M', 'Bronze')


-------------------------------------- 02 - Sydney	2000	Athletics	Athletics	100m	women
-- its updated

-------------------------------------- 03 - London	2012	Weightlifting	Weightlifting	105kg heavyweight men	
select *
from combined_olympics_medals_03
where Year = '2012'
and Sport = 'Weightlifting'
and Discipline ='Weightlifting'
and Event ='105kg heavyweight men'
and Event_gender ='M'



update combined_olympics_medals_03
set Medal = case 
when Medal = 'Silver' then 'Gold'
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2012'
and Sport = 'Weightlifting'
and Discipline ='Weightlifting'
and Event ='105kg heavyweight men'
and Event_gender ='M'

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Weightlifting', 'Weightlifting', '105kg heavyweight men','Ivan EFREMOV', 'UZB', 'Uzbekistan','M', 'Bronze')








-- case 02 - Silver
-- Identify Events Without a Silver Medal
select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals_03
group by City, Year, Sport, Discipline, Event,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Silver' then 1 else 0 end ) = 0
-- 19 rows 
-- there are some possibility they share medals 

--01---------------
select *
from combined_olympics_medals_03
where Year = '2004'
and Sport = 'Tennis'
and Discipline ='Tennis'
and Event ='doubles'
and Event_gender ='W'

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Athens','2004', 'Tennis', 'Tennis', 'doubles','vivi RUANO', 'ESP', 'Spain','W', 'Silver')

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Athens','2004', 'Tennis', 'Tennis', 'doubles','Conchita MARTINEZ', 'ESP', 'Spain','W', 'Silver')

------02------------------------------------------
select *
from combined_olympics_medals_03
where Year = '2008'
and Sport = 'Cycling'
and Discipline ='Cycling Road'
and Event ='individual road race'
and Event_gender ='M'

update combined_olympics_medals_03
set Medal = case 
when Medal = 'Bronze' then 'Silver'
else Medal
end 
where Year = '2008'
and Sport = 'Cycling'
and Discipline ='Cycling Road'
and Event ='individual road race'
and Event_gender ='M'

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('Beijing','2008', 'Cycling', 'Cycling Road', 'individual road race','Alexandr KOLOBNEV', 'RUS', 'Russia','M', 'Bronze')



---- 03 ----------------------------------------------
select *
from combined_olympics_medals_03
where Year = '2012'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='1500m'
and Event_gender ='W'

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '1500m','Tatyana TOMASHOVA', 'RUS', 'Russia','W', 'Silver')

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '1500m','Abeba AREGAWI', 'ETH', 'Ethiopia','W', 'Bronze')


----


-- case 03 - Bronze
-- Identify Events Without a Bronze Medal
select City,Year,Sport, Discipline, Event,Event_gender, count(distinct Medal) as Medal_Count
from  combined_olympics_medals_03
group by City, Year, Sport, Discipline, Event,Event_gender
having count(distinct Medal) < 3 
and sum (case when Medal ='Bronze' then 1 else 0 end ) = 0
-- 18 rows 
-- there are some possibility they share medals 

-- 01-------------------------------
select *
from combined_olympics_medals_03
where Year = '2012'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='800m'
and Event_gender ='W'

insert into combined_olympics_medals_03 (City, Year,Sport, Discipline, Event,Athlete, Country_Code, Country,Event_gender, Medal)
values ('London','2012', 'Athletics', 'Athletics', '800m','Pamela JELIMO', 'KEN', 'Kenya','W', 'Bronze')



----
select *
from combined_olympics_medals_03
where Year = '2016'
and Sport = 'Aquatics'
and Discipline ='Swimming'
and Event ='100m butterfly'
and Event_gender ='M'


---- in this way can check medal was shared 
--select City,Year,Sport, Discipline, Event,Event_gender, count(Athlete) as Medal_Share_Count
--from  combined_olympics_medals_03
--group by City, Year, Sport, Discipline, Event,Event_gender
--having count(Athlete) > 1 

---- some of rows include all of the team members so this is not working. 



select *
from combined_olympics_medals_03
where Year = '2000'
and Sport = 'Athletics'
and Discipline ='Athletics'
and Event ='4x400m relay'
and Event_gender ='M'



select *
from combined_olympics_medals_03
where Year = '2020'
and Country_Code = 'USA'
and Medal ='Silver'




-- get rid of copies in memeber teams 
select *
into combined_olympics_medals_04
from combined_olympics_medals_03



-- use CTE for that - get duplicates
with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from combined_olympics_medals_04
)
select *
from get_duplicate
where row_num > 1




with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from combined_olympics_medals_04
)
delete
from get_duplicate
where row_num > 1



select *
from combined_olympics_medals_04


--now drop Athlete column 
alter table combined_olympics_medals_04
drop column Athlete


select *
from combined_olympics_medals_04


-- now all in one row , all team as one row 
-- 10118 
select *
from combined_olympics_medals_04
where Year = '2016'
and Country_Code = 'USA'
and Medal ='Bronze'


select *
from combined_olympics_medals_04
where Year = '2016'
and Country_Code = 'USA'
and Medal ='Gold'



--  get medal list - 2020
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from combined_olympics_medals_04
where Year ='2020'
group by Country_Code
order by 5 desc



-- check for china 

select *
from combined_olympics_medals_04
where Year = '2020'
and Country_Code = 'CHN'
and Medal ='Gold'


select *
from combined_olympics_medals_04
where Year = '2020'
and Country_Code = 'GBR'
and Medal ='Silver'



select *
from olympics_medals_06






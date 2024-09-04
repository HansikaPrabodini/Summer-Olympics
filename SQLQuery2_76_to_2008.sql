USE [olympics]
GO

SELECT [City]
      ,[Year]
      ,[Sport]
      ,[Discipline]
      ,[Event]
      ,[Athlete]
      ,[Gender]
      ,[Country_Code]
      ,[Country]
      ,[Event_gender]
      ,[Medal]
  FROM [dbo].['Summer-Olympic-medals-1976-to-2$']

GO


select *
from olympics_medals_05


select *
from ['Summer-Olympic-medals-1976-to-2$']

-- Create copy of this
select *
into olympics_76_01
from ['Summer-Olympic-medals-1976-to-2$']


select *
from olympics_76_01

-- need to update Discipline same as olympics_medals_05
update olympics_76_01
set Discipline = 'Artistic Gymnastics'
where Discipline = 'Artistic G.'


update olympics_76_01
set Discipline = 'Rhythmic Gymnastics'
where Discipline = 'Rhythmic G.'


update olympics_76_01
set Discipline = 'Trampoline Gymnastics'
where Discipline = 'Trampoline'


update olympics_76_01
set Discipline = 'Wrestling Free'
where Discipline = 'Wrestling Free.'

update olympics_76_01
set Discipline = 'Cycling Mountain Bike'
where Discipline = 'Mountain Bike'


update olympics_76_01
set Discipline = 'Cycling BMX'
where Discipline = 'BMX'

update olympics_76_01
set Discipline = 'Synchronized Swimming'
where Discipline = 'Synchronized S.'

select *
from olympics_76_01

select distinct Event
from olympics_76_01




--update Cycling BMX as event BMX individual
update olympics_76_01
set Event ='BMX individual'
where Discipline = 'Cycling BMX'

---need to change Team Pursuit 4000m as Team Pursuit
update olympics_76_01
set Event ='Team Pursuit'
where Event = 'Team Pursuit (4000m)'

--- ( Event = 'Olympic Sprint' or Event = 'sprint' or Event = 'Sprint indivual') all are same event call it Sprint
update olympics_76_01
set Event ='Sprint'
where Discipline = 'Cycling Track'
and ( Event = 'Olympic Sprint' or Event = 'sprint' or Event = 'Sprint indivual')



---- create event list 
select distinct Event
from olympics_76_01
where Discipline = 'Cycling Mountain Bike'



select *
from olympics_76_01
where Discipline = 'Cycling Track'
and ( Event = 'Olympic Sprint' or Event = 'sprint' or Event = 'Sprint indivual')




select *
from olympics_76_01
where Discipline = 'Cycling Track'

select *
from olympics_76_01
where Sport = 'Volleyball'
and Discipline ='Beach Volleyball'

-- need to change Beach volley. to Beach Volleyball
update olympics_76_01
set Discipline = 'Beach Volleyball'
where Discipline ='Beach volley.'




-----------
select distinct Event
from olympics_76_01
where Discipline = 'Wrestling Free'


-----------
select *
from olympics_76_01
where Discipline = 'Wrestling Free'
and Event_gender = 'W'

select distinct Event
from olympics_76_01
where Discipline = 'Wrestling Free'
and Event_gender = 'M'

select distinct Event
from olympics_76_01
where Discipline = 'Wrestling Gre-R'

--need to update judo with newly olympics event 
-- create another copy of table 

select *
into olympics_76_03
from olympics_76_01

select *
from olympics_76_03

-- update as this 
--Men's Judo Events:

--1. Extra-Lightweight (-60 kg)
--2. Half-Lightweight (-66 kg)
--3. Lightweight (-73 kg)
--4. Half-Middleweight (-81 kg)
--5. Middleweight (-90 kg)
--6. Half-Heavyweight (-100 kg)
--7. Heavyweight (+100 kg)

--Women's Judo Events:

--1. Extra-Lightweight (-48 kg)
--2. Half-Lightweight (-52 kg)
--3. Lightweight (-57 kg)
--4. Half-Middleweight (-63 kg)
--5. Middleweight (-70 kg)
--6. Half-Heavyweight (-78 kg)
--7. Heavyweight (+78 k

--For men 
-- update Extra-Lightweight (-60 kg)
update olympics_76_03
set Event = 'Extra-Lightweight (-60 kg)'
where Event = '- 60 kg'


-- update 60 - 66kg (half-lightweight)
-- use join and update again 
update olympics_76_03
set Event = '60 - 66kg (half-lightweight)'
where Event = '60 - 65kg (half-lightweight)'




-- update 66 - 73kg (lightweight)
update olympics_76_03
set Event = '66 - 73kg (lightweight)'
where Event = '65 - 71kg (lightweight)'
and Event = '- 63kg (lightweight)'


-- update 73 - 81kg (half-middleweight)
update olympics_76_03
set Event = '73 - 81kg (half-middleweight)'
where Event = '63 - 70kg (half-middleweight)'
or Event = '71 - 78kg (half-middleweight)'


-- update 81 - 90kg (middleweight)
update olympics_76_03
set Event = '81 - 90kg (middleweight)'
where Event = '78 - 86kg (middleweight)'
or Event = '70 - 80kg (middleweight)'



-- update 90 - 100kg (half-heavyweight)
update olympics_76_03
set Event = '90 - 100kg (half-heavyweight)'
where Event = '80 - 93kg (half-heavyweight)'
or Event = '86 - 95kg (half-heavyweight)'

-- update + 100kg (heavyweight)
update olympics_76_03
set Event = '+ 100kg (heavyweight)'
where Event = '+ 93kg (heavyweight)'
or Event = '+ 95kg (heavyweight)'

--------------- for women ---

-- update - 48kg (extra-lightweight)
update olympics_76_03
set Event = '- 48kg (extra-lightweight)'
where Event = '- 48 kg'


-- update 52 - 57kg (lightweight)
update olympics_76_03
set Event = '52 - 57kg (lightweight)'
where Event = '52 - 56kg (lightweight)'


-- update 57 - 63kg (half-middleweight)
update olympics_76_03
set Event = '57 - 63kg (half-middleweight)'
where Event = '56 - 61kg (half-middleweight)'

-- update 63 - 70kg (middleweight)
update olympics_76_03
set Event = '63 - 70kg (middleweight)'
where Event = '61 - 66kg (middleweight)'

-- update 70 - 78kg (half-heavyweight)
update olympics_76_03
set Event = '70 - 78kg (half-heavyweight)'
where Event = '66 - 72kg (half-heavyweight)'


-- update + 78kg (heavyweight)
update olympics_76_03
set Event = '+ 78kg (heavyweight)'
where Event = '+ 72kg (heavyweight)'


select *
from olympics_76_03
where Discipline = 'Athletics'
and Event_gender = 'W'


select distinct Event
from olympics_76_03
where Discipline = 'Athletics'
and Event_gender = 'M'



--add 20km race walk as 20km walk 
-- update 
update olympics_76_03
set Event = '20km walk'
where Event = '20km race walk'


--add 3000 as 3000m steeplechase
-- update 3000m steeplechase
update olympics_76_03
set Event = '3000m steeplechase'
where Event = '3000'


select *
from olympics_76_03

select *
from olympics_76_03
where Event_gender is Null

---- i want remove Event_gender is Null 
-- in there city , sport , discipline ,event ,gender , country ,country_code , medal all are null 

--for that create another copy of table 
select *
into olympics_76_04
from olympics_76_03

select *
from olympics_76_04

DELETE FROM olympics_76_04
WHERE Event_gender is null 
and Event is null 
and Sport is null 
and Discipline is null 
and Athlete is null
and Country is null
and Country_Code is null
and Medal is null 
-- 117 rows affected 




select *
from olympics_76_04


------now again move into events 
-- Boxing --
-- weightlifting --
-- golf --
-- rugby -- 
-- karate --

select distinct Sport
from olympics_76_04

select *
from olympics_76_04
where Sport ='Golf'
and Event_gender = 'W'


select distinct Event
from olympics_76_04
where Discipline = 'Boxing'
and Event_gender = 'W'


--update Flyweight (up to 52 kg) 
update olympics_76_04
set Event = 'Flyweight (up to 52 kg)'
where (Event = '- 48kg (light-flyweight)' or Event = '48kg (light flywieght)'  )
and Sport ='Boxing'


--update Featherweight (up to 57 kg) 
update olympics_76_04
set Event = 'Featherweight (up to 57 kg)'
where (Event = '54 - 57kg (featherweight)' or Event = '51 - 54kg (bantamweight)'  )
and Sport ='Boxing'

--update Lightweight (up to 63 kg)
update olympics_76_04
set Event = 'Lightweight (up to 63 kg)'
where (Event = '57 - 60kg (lightweight)' or Event = '60 - 63.5kg (light-welterweight)' or  Event = '60 - 64 kg'  )
and Sport ='Boxing'


--update Welterweight (up to 69 kg)
update olympics_76_04
set Event = 'Welterweight (up to 69 kg)'
where (Event = '63.5 - 67kg (welterweight)' or Event = '64 - 69 kg'  )
and Sport ='Boxing'


--update Middleweight (up to 75 kg)
update olympics_76_04
set Event = 'Middleweight (up to 75 kg)'
where (Event = '67 - 71kg (light-middleweight)'   or Event = '71-75kg' )
and Sport ='Boxing'


--update Light Heavyweight (up to 81 kg)
update olympics_76_04
set Event = 'Light Heavyweight (up to 81 kg)'
where (Event = '75 - 81kg (light-heavyweight)'  )
and Sport ='Boxing'

--update Heavyweight (up to 91 kg)
update olympics_76_04
set Event = 'Heavyweight (up to 91 kg)'
where (Event = '81 - 91kg (heavyweight)'  or Event = '+ 81kg (heavyweight)' )
and Sport ='Boxing'

--update Super Heavyweight (over 91 kg)
update olympics_76_04
set Event = 'Super Heavyweight (over 91 kg)'
where (Event = '+ 91kg (super heavyweight)'  )
and Sport ='Boxing'



select distinct Sport
from olympics_76_04

select *
from olympics_76_04
where Sport ='Golf'
and Event_gender = 'W'


select distinct Event
from olympics_76_04
where Discipline = 'Boxing'
and Event_gender = 'W'



--- want to drop Gender column so create copy of table 
select *
into olympics_76_05
from olympics_76_04

select *
from olympics_76_05

ALTER TABLE olympics_76_05
DROP COLUMN Gender 






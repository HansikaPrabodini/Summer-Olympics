USE [olympics]
GO

SELECT [discipline_title]
      ,[slug_game]
      ,[event_title]
      ,[event_gender]
      ,[medal_type]
      ,[participant_type]
      ,[participant_title]
      ,[athlete_url]
      ,[athlete_full_name]
      ,[country_name]
      ,[country_code]
      ,[country_3_letter_code]
  FROM [dbo].[olympic_medals$]

GO


select *
from [olympic_medals$]
where slug_game ='tokyo-2020'
and event_title = 'Men''s 100m'

select *
from olympic_medals$
where slug_game ='tokyo-2020'
and country_3_letter_code = 'USA'
and discipline_title = 'Swimming'


select *
from olympic_medals$
where slug_game ='rio-2016'
and country_3_letter_code = 'USA'
and discipline_title = 'Swimming'



select *
from  olympic_athletes$


select *
from ['Summer-Olympic-medals-1976-to-2$']

-- create copy of olympic_medals$ table as olympic_medals 
select *
into olympic_medals 
from olympic_medals$

select *
from olympic_medals



-- only want 2012 , 2016 , 2020 summer olympics medals 
select *
from olympic_medals
where slug_game ='tokyo-2020'
or slug_game ='rio-2016'
or slug_game = 'london-2012'



-- now i only want to create 2012 , 2016 , 2020 summer olympics medals table - (3295 rows affected)
select *
into olympics_medals_01
from olympic_medals
where slug_game ='tokyo-2020'
or slug_game ='rio-2016'
or slug_game = 'london-2012'


-- now use olympics_medals_01
select *
from olympics_medals_01



-- i want modifi this as same like ['Summer-Olympic-medals-1976-to-2$'] then i can use it for further analyzing 

select *
from ['Summer-Olympic-medals-1976-to-2$']

-- as a first step i divided slug_game to City and Year 

select *
from olympics_medals_01

-- Replace '-' with '.' and then use PARSENAME
SELECT 
    PARSENAME(REPLACE(slug_game, '-', '.'), 2) AS Part1,
    PARSENAME(REPLACE(slug_game, '-', '.'), 1) AS Part2
from olympics_medals_01


-- create another copy of olympics_medals_01 and add City varchar column , Year Float column 
select * 
into olympics_medals_02
from olympics_medals_01

select *
from olympics_medals_02

alter table olympics_medals_02
add City Varchar(255) ,
Year Float

-- update columns 

update olympics_medals_02
set City = PARSENAME(REPLACE(slug_game, '-', '.'), 2) 


update olympics_medals_02
set Year = PARSENAME(REPLACE(slug_game, '-', '.'), 1)


--- Now i set City First letter to capital letter 
update olympics_medals_02
set City =  upper(substring(City, 1, 1)) + lower(substring(City, 2, len(City)))






select *
from olympics_medals_02

select distinct Sport
from ['Summer-Olympic-medals-1976-to-2$']

select distinct Discipline
from ['Summer-Olympic-medals-1976-to-2$']
where Sport = 'Taekwondo'


select *
from ['Summer-Olympic-medals-1976-to-2$']
where Sport = 'Cycling'

select *
from olympics_medals_02
where discipline_title = 'Baseball'


--- now want to introduce Sport column to  olympics_medals_03 table 
select *
into olympics_medals_03
from olympics_medals_02


select *
from olympics_medals_03

-- add sport column 
alter table olympics_medals_03
add Sport varchar(255)


update olympics_medals_03
set Sport = 'Weightlifting'
where discipline_title = 'Weightlifting'


update olympics_medals_03
set Sport = 'Boxing'
where discipline_title = 'Boxing'


update olympics_medals_03
set Sport = 'Football'
where discipline_title = 'Football'


update olympics_medals_03
set Sport = 'Badminton'
where discipline_title = 'Badminton'


update olympics_medals_03
set Sport = 'Archery'
where discipline_title = 'Archery'



update olympics_medals_03
set Sport = 'Triathlon'
where discipline_title = 'Triathlon'


update olympics_medals_03
set Sport = 'Fencing'
where discipline_title = 'Fencing'




update olympics_medals_03
set Sport = 'Tennis'
where discipline_title = 'Tennis'


update olympics_medals_03
set Sport = 'Modern Pentathlon'
where discipline_title = 'Modern Pentathlon'



update olympics_medals_03
set Sport = 'Judo'
where discipline_title = 'Judo'


update olympics_medals_03
set Sport = 'Sailing'
where discipline_title = 'Sailing'




update olympics_medals_03
set Sport = 'Basketball'
where discipline_title = 'Basketball'


update olympics_medals_03
set Sport = 'Hockey'
where discipline_title = 'Hockey'


update olympics_medals_03
set Sport = 'Table Tennis'
where discipline_title = 'Table Tennis'



update olympics_medals_03
set Sport = 'Handball'
where discipline_title = 'Handball'



update olympics_medals_03
set Sport = 'Rowing'
where discipline_title = 'Rowing'



update olympics_medals_03
set Sport = 'Athletics'
where discipline_title = 'Athletics'


update olympics_medals_03
set Sport = 'Shooting'
where discipline_title = 'Shooting'


update olympics_medals_03
set Sport = 'Taekwondo'
where discipline_title = 'Taekwondo'


select *
from olympics_medals_03
where discipline_title like '%Volleyball%'


-- update 

update olympics_medals_03
set Sport = 'Aquatics'
where discipline_title = 'Diving'
or discipline_title = 'Water polo'
or discipline_title = 'Swimming'
or discipline_title = 'Synchronized Swimming'



update olympics_medals_03
set Sport = 'Canoe / Kayak'
where discipline_title like '%Canoe%'


update olympics_medals_03
set Sport = 'Gymnastics'
where discipline_title like '%Gymnastics%'
or discipline_title like '%Trampoline%'


update olympics_medals_03
set Sport = 'Cycling'
where discipline_title like '%Cycling%'


update olympics_medals_03
set Sport = 'Equestrian'
where discipline_title like '%Equestrian%'


update olympics_medals_03
set Sport = 'Wrestling'
where discipline_title like '%Wrestling%'



update olympics_medals_03
set Sport = 'Volleyball'
where discipline_title like '%Volleyball%'



select *
from olympics_medals_03


-- checking for sport nulls 
select *
from olympics_medals_03
where Sport is null

-- create copy of table 
select *
into olympics_medals_04
from olympics_medals_03


select *
from olympics_medals_04
where Sport is null


-- update baseball and softball 
update olympics_medals_04
set Sport = 'Baseball'
where event_title ='Baseball'


update olympics_medals_04
set Sport = 'Softball'
where event_title = 'Softball'


-- Update BasketBall 
update olympics_medals_04
set Sport = 'Basketball'
where discipline_title like '%Basketball%'



-- The 2020 Summer Olympics in Tokyo saw the introduction of four new sports, with karate, skateboarding, sport climbing and surfing making their Olympic debuts.
-- update Skateboarding
update olympics_medals_04
set Sport = 'Skateboarding'
where discipline_title= 'Skateboarding'

-- update Karate
update olympics_medals_04
set Sport = 'Karate'
where discipline_title= 'Karate'



-- update golf
update olympics_medals_04
set Sport = 'Golf'
where discipline_title= 'Golf'


-- update Rugby
update olympics_medals_04
set Sport = 'Rugby'
where discipline_title like '%Rugby%'



-- update Surfing
update olympics_medals_04
set Sport = 'Surfing'
where discipline_title= 'Surfing'


-- update Sport Climbing
update olympics_medals_04
set Sport = 'Sport Climbing'
where discipline_title= 'Sport Climbing'

-- update Aquatics
update olympics_medals_04
set Sport = 'Aquatics'
where discipline_title= 'Marathon Swimming'
or discipline_title= 'Artistic Swimming'

---------------------------------------------------
select *
from olympics_medals_04

select *
from ['Summer-Olympic-medals-1976-to-2$']



-- move into create Discipline 
-- get another copy of previous table 

select *
into olympics_medals_05
from olympics_medals_04


select *
from olympics_medals_05

-- add Discipline column to table 
alter table olympics_medals_05
add Discipline varchar(255) 

update olympics_medals_05
set Discipline = Sport
where Sport = 'Weightlifting'
or Sport = 'Boxing'
or Sport = 'Football'
or Sport = 'Badminton'
or Sport = 'Archery'
or Sport = 'Triathlon'
or Sport = 'Fencing'
or Sport = 'Tennis'
or Sport = 'Modern Pentathlon'
or Sport = 'Judo'
or Sport = 'Sailing'
or Sport = 'Basketball'
or Sport = 'Softball'
or Sport = 'Hockey'
or Sport = 'Table Tennis'
or Sport = 'Handball'
or Sport = 'Rowing'
or Sport = 'Athletics'
or Sport = 'Shooting'
or Sport = 'Taekwondo'
or Sport = 'Skateboarding'
or Sport = 'Baseball'
or Sport = 'Karate'
or Sport = 'Golf'
or Sport = 'Surfing'
or Sport = 'Weightlifting'
or Sport = 'Rugby'





select *
from olympics_medals_05
where Discipline is null

select *
from ['Summer-Olympic-medals-1976-to-2$']
where Discipline like '%Beach%'


-- upadte Sport Climbing 
update olympics_medals_05
set Discipline = 'Sport Climbing'
where discipline_title = 'Sport Climbing'

-- upadte Diving 
update olympics_medals_05
set Discipline = 'Diving'
where discipline_title = 'Diving'


-- update Swimming 
update olympics_medals_05
set Discipline = 'Swimming'
where discipline_title = 'Swimming'


--update Beach Volleyball
update olympics_medals_05
set Discipline = 'Beach Volleyball'
where discipline_title = 'Beach Volleyball'



--update Volleyball
update olympics_medals_05
set Discipline = 'Volleyball'
where discipline_title = 'Volleyball'

-- update Water plo
update olympics_medals_05
set Discipline = 'Water Polo'
where discipline_title = 'Water Polo'

--update Marathon Swimming
update olympics_medals_05
set Discipline = 'Swimming'
where discipline_title = 'Marathon Swimming'


--update Volleyball  
update olympics_medals_05
set Discipline = 'Synchronized Swimming'
where discipline_title = 'Synchronized Swimming'

--update Artistic Swimming
update olympics_medals_05
set Discipline = 'Synchronized Swimming'
where discipline_title = 'Artistic Swimming'
-- in here i use all Artistic Swimming as Synchronized Swimming , in tokyo olympic Synchronized Swimming rename as Artistic Swimming
--


--update Cycling BMX
update olympics_medals_05
set Discipline = 'Cycling BMX'
where discipline_title = 'Cycling BMX'
or discipline_title = 'Cycling BMX Racing'
or discipline_title = 'Cycling BMX Freestyle'


--update Cycling Track
update olympics_medals_05
set Discipline = 'Cycling Track'
where discipline_title = 'Cycling Track'


--update Cycling Mountain Bike
update olympics_medals_05
set Discipline = 'Cycling Mountain Bike'
where discipline_title = 'Cycling Mountain Bike'

--update Cycling Road
update olympics_medals_05
set Discipline = 'Cycling Road'
where discipline_title = 'Cycling Road'



--update Cycling Track
update olympics_medals_05
set Discipline = 'Cycling Road'
where discipline_title = 'Cycling Road'



-- update Canoe / Kayak
--update Canoe Sprint
update olympics_medals_05
set Discipline = 'Canoe / Kayak F'
where discipline_title = 'Canoe Sprint'

--update Canoe Slalom
update olympics_medals_05
set Discipline = 'Canoe / Kayak S'
where discipline_title = 'Canoe Slalom'



-- update Gymnastic 
--update Gymnastics Artistic
update olympics_medals_05
set Discipline = 'Artistic Gymnastics'
where discipline_title = 'Gymnastics Artistic'
or discipline_title = 'Artistic Gymnastics' 


--update Rhythmic Gymnastics
update olympics_medals_05
set Discipline = 'Rhythmic Gymnastics'
where discipline_title = 'Gymnastics Rhythmic'
or discipline_title = 'Rhythmic Gymnastics' 


--update Trampoline Gymnastics
update olympics_medals_05
set Discipline = 'Trampoline Gymnastics'
where discipline_title = 'Trampoline Gymnastics'
or discipline_title = 'Trampoline' 



-- Update Wrestling
--update Wrestling Free
update olympics_medals_05
set Discipline = 'Wrestling Free'
where discipline_title like '%Wrestling%'
and event_title like '%Freestyle%'
and Discipline is null 


--update Wrestling Gre-R
update olympics_medals_05
set Discipline = 'Wrestling Gre-R'
where discipline_title like '%Wrestling%'
and event_title like '%Greco-Roman%'
and Discipline is null


-- update Equestrian
-- update Equestrian Dressage
update olympics_medals_05
set Discipline = 'Dressage'
where discipline_title like '%Equestrian%'
and event_title like '%Dressage%'
and slug_game = 'tokyo-2020'

update olympics_medals_05
set Discipline = 'Dressage'
where discipline_title = 'Equestrian Dressage'


-- update Eventing
update olympics_medals_05
set Discipline = 'Eventing'
where discipline_title like '%Equestrian%'
and event_title like '%Eventing%'
and slug_game = 'tokyo-2020'


update olympics_medals_05
set Discipline = 'Eventing'
where discipline_title = 'Equestrian Eventing'


-- update Jumping
update olympics_medals_05
set Discipline = 'Jumping'
where discipline_title like '%Equestrian%'
and event_title like '%Jumping%'
and slug_game = 'tokyo-2020'


update olympics_medals_05
set Discipline = 'Jumping'
where discipline_title = 'Equestrian Jumping'


-----------------------------------------------------------
select *
from olympics_medals_05


select *
from olympics_76_01

--creat cpy of table and another column
select *
into olympics_medals_06
from olympics_medals_05

alter table olympics_medals_06
add Event varchar(255)


--- check for events 
--- focus on diving events------------------------------------ 
-- need to modifi  as 
--10m platform
--3m springboard
--synchronized diving 10m platform
--synchronized diving 3m springboard

select *
from olympics_medals_06

select distinct event_title
from olympics_medals_06
where Discipline = 'Diving'

update olympics_medals_06
set Event = 'synchronized diving 3m springboard'
where event_title = 'synchronized diving 3m springboard men'
or event_title = 'synchronized diving 3m springboard women'
or event_title = 'Women''s Synchronised 3m Springboard'
or event_title = 'Men''s Synchronised 3m Springboard'


update olympics_medals_06
set Event = 'synchronized diving 10m platform'
where event_title = 'synchronized diving 10m platform men'
or event_title = 'synchronized diving 10m platform women'
or event_title = 'Women''s Synchronised 10m Platform'
or event_title = 'Men''s Synchronised 10m Platform'



update olympics_medals_06
set Event = '10m platform'
where event_title = '10m platform men'
or event_title = '10m platform women'
or event_title = 'Men''s 10m Platform'
or event_title = 'Women''s 10m Platform'

update olympics_medals_06
set Event = '3m springboard'
where event_title = '3m springboard men'
or event_title = '3m springboard women'
or event_title = 'Men''s 3m Springboard'
or event_title = 'Women''s 3m Springboard'

select *
from olympics_medals_06
where Discipline = 'Diving'

select *
from olympics_medals_06
where Event is not null


---------------------- swimming ------------------
--update Marathon Swimming
update olympics_medals_06
set Discipline = 'Swimming'
where discipline_title = 'Marathon Swimming'

select *
from olympics_medals_06
where discipline_title like '%Swimming%'
and event_title like '%100m freestyle relay%'
and Event is not  null

select distinct event_title
from olympics_medals_06
where Discipline = 'Swimming'


-- update 100m backstroke
update olympics_medals_06
set Event = '100m backstroke'
where Event is  null
and event_title like '%100m backstroke%'
or event_title like '%100m Backstroke%'


-- update 100m breaststroke
update olympics_medals_06
set Event = '100m breaststroke'
where Event is  null
and event_title like '%100m breaststroke%'
or event_title like '%100m Breaststroke%'



-- update 100m butterfly
update olympics_medals_06
set Event = '100m butterfly'
where Event is  null
and event_title like '%100m butterfly%'
or event_title like '%100m Butterfly%'



-- update 100m freestyle
update olympics_medals_06
set Event = '100m freestyle'
where Event is  null
and event_title like '%100m freestyle%'
or event_title like '%100m Freestyle%'

-- update 4x100m freestyle relay
update olympics_medals_06
set Event = '4x100m freestyle relay'
where event_title like '%4x100m freestyle relay%'
or event_title like '%4 x 100m Freestyle Relay%'




-- update 4x100m medley relay
update olympics_medals_06
set Event = '4x100m medley relay'
where Event is  null
and event_title like '4x100m medley relay%'
or event_title like '%4 x 100m Medley Relay%'


-- update 4x200m freestyle relay
update olympics_medals_06
set Event = '4x200m freestyle relay'
where event_title like '%4x200m freestyle relay%'
or event_title like '%4 x 200m Freestyle Relay%'


-- update 1500m freestyle
update olympics_medals_06
set Event = '1500m freestyle'
where Event is  null
and event_title like '%1500m freestyle%'
or event_title like '%1500m Freestyle%'


-- update 1500m freestyle
update olympics_medals_06
set Event = '1500m freestyle'
where Event is  null
and event_title like '%1500m freestyle%'
or event_title like '%1500m Freestyle%'


-- update 200m backstroke
update olympics_medals_06
set Event = '200m backstroke'
where Event is  null
and event_title like '%200m backstroke%'
or event_title like '%200m Backstroke%'


-- update 200m breaststroke
update olympics_medals_06
set Event = '200m breaststroke'
where Event is  null
and event_title like '%200m breaststroke%'
or event_title like '%200m Breaststroke%'




-- update 200m butterfly
update olympics_medals_06
set Event = '200m butterfly'
where Event is  null
and event_title like '%200m butterfly%'
or event_title like '%200m Butterfly%'



-- update 200m freestyle
update olympics_medals_06
set Event = '200m freestyle'
where Event is  null
and (event_title like '%200m freestyle%'
or event_title like '%200m Freestyle%')


-- update 200m individual medley
update olympics_medals_06
set Event = '200m individual medley'
where Event is  null
and (event_title like '%200m individual medley%'
or event_title like '%200m Individual Medley%')


-- update 400m freestyle
update olympics_medals_06
set Event = '400m freestyle'
where Event is  null
and (event_title like '%400m freestyle%'
or event_title like '%400m Freestyle%')


-- update 400m individual medley
update olympics_medals_06
set Event = '400m individual medley'
where Event is  null
and (event_title like '%400m individual medley%'
or event_title like '%400m Individual Medley%')



-- update 50m freestyle
update olympics_medals_06
set Event = '50m freestyle'
where Event is  null
and (event_title like '%50m freestyle%'
or event_title like '%50m Freestyle%')



-- update 800m freestyle
update olympics_medals_06
set Event = '800m freestyle'
where Event is  null
and (event_title like '%800m freestyle%'
or event_title like '%800m Freestyle%')


--special
--- update marathon 10km
update olympics_medals_06
set Event = 'marathon 10km'
where Event is  null
and ((event_title like '%Marathon - 10 km%' and Discipline = 'Swimming')
or (event_title like '%10km%' and Discipline = 'Swimming'))




-----------water polo ------------

-- update water polo
update olympics_medals_06
set Event = 'water polo'
where discipline_title = 'Water Polo'


---------------- Synchronized Swimming ------------
select *
from olympics_medals_06
where Sport = 'Aquatics'
and Event is null


--- update duet
update olympics_medals_06
set Event = 'duet'
where Event is  null
and Discipline = 'Synchronized Swimming'
and event_title like '%duet%'

--- update team
update olympics_medals_06
set Event = 'team'
where Event is  null
and Discipline = 'Synchronized Swimming'
and event_title like '%team%'




---------------------------Gymnastics -----------------------------
---------------------- Artistic Gymnastics ------------------------




select distinct event_title
from olympics_medals_06
where Discipline = 'Artistic Gymnastics'


select *
from olympics_medals_06
where Discipline = 'Artistic Gymnastics'
and event_title like '%floor exercises%'

--- update balance beam
update olympics_medals_06
set Event = 'balance beam'
where Discipline = 'Artistic Gymnastics'
and event_title like '%balance beam%'
and Event is null


--- update floor exercises
update olympics_medals_06
set Event = 'floor exercises'
where Discipline = 'Artistic Gymnastics'
and event_title like '%floor exercises%'
and Event is null



--- update floor exercises
update olympics_medals_06
set Event = 'floor exercises'
where Discipline = 'Artistic Gymnastics'
and ( event_title like '%floor exercises%' or event_title like '%Floor Exercise%')
and Event is null


--- update horizontal bar
update olympics_medals_06
set Event = 'horizontal bar'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%horizontal bar%' or event_title like '%Horizontal Bar%')
and Event is null


--- update individual all-round
update olympics_medals_06
set Event = 'individual all-round'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%individual all-round%' or event_title like '%All-Around%')
and Event is null


--- update parallel bars
update olympics_medals_06
set Event = 'parallel bars'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%parallel bars%' or event_title like '%Parallel Bars%')
and Event is null



--- update pommel horse
update olympics_medals_06
set Event = 'pommel horse'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%pommel horse%' or event_title like '%Pommel Horse%')
and Event is null


--- update rings
update olympics_medals_06
set Event = 'rings'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%rings%' or event_title like '%Rings%')
and Event is null


--- update uneven bars
update olympics_medals_06
set Event = 'uneven bars'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%uneven bars%' or event_title like '%Uneven Bars%')
and Event is null



--- update vault
update olympics_medals_06
set Event = 'vault'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%vault%' or event_title like '%Vault%')
and Event is null


--- update team competition
update olympics_medals_06
set Event = 'team competition'
where Discipline = 'Artistic Gymnastics'
and (event_title like '%team%' or event_title like '%team competition%')
and Event is null





----------------------------- Gymnastics Rhythmic ---------------------------

select distinct event_title
from olympics_medals_06
where Discipline = 'Rhythmic Gymnastics'

--- update group competition
update olympics_medals_06
set Event = 'group competition'
where Discipline = 'Rhythmic Gymnastics'
and (event_title like '%group competition%' or event_title like '%Group All-Around%')
and Event is null



--- update individual all-round
update olympics_medals_06
set Event = 'individual all-round'
where Discipline = 'Rhythmic Gymnastics'
and (event_title like '%individual all-round%' or event_title like '%Individual All-Around%')
and Event is null



------------------------------ Trampoline Gymnastics --------------------------------

select *
from olympics_medals_06
where Discipline = 'Trampoline Gymnastics'

update olympics_medals_06
set Event = 'individual'
where Discipline = 'Trampoline Gymnastics'
and Event is null


-------------------------------- Equestrian---------------------
------------------------------- Equestrian Dressage ----------------

select distinct event_title
from olympics_medals_06
where Discipline = 'Dressage'

select *
from olympics_medals_06
where Discipline = 'Dressage'

--- update individual
update olympics_medals_06
set Event = 'individual'
where Discipline = 'Dressage'
and event_title like '%individual%' 
and Event is null


--- update team
update olympics_medals_06
set Event = 'team'
where Discipline = 'Dressage'
and event_title like '%Dressage Team%' 
and Event is null



--------------------------------------- Eventing ------------------------
select distinct event_title
from olympics_medals_06
where Discipline = 'Eventing'

--- update individual
update olympics_medals_06
set Event = 'individual'
where Discipline = 'Eventing'
and event_title like '%individual%' 
and Event is null


--- update team
update olympics_medals_06
set Event = 'team'
where Discipline = 'Eventing'
and event_title like '%Eventing Team%' 
and Event is null



------------------------- Jumping ------------------
select distinct event_title
from olympics_medals_06
where Discipline = 'Jumping'


--- update individual
update olympics_medals_06
set Event = 'individual'
where Discipline = 'Jumping'
and event_title like '%individual%' 
and Event is null


--- update team
update olympics_medals_06
set Event = 'team'
where Discipline = 'Jumping'
and event_title like '%Jumping Team%' 
and Event is null




---------------------------------------------Cycling -----------
--------------------------------- Cycling BMX---------------

select *
from olympics_medals_06
where Discipline = 'Cycling BMX'

-- in here need to introduce Events Racing and Freestyle
-- Cycling BMX Racing - as Racing Individual
-- Cycling BMX Freestyle - Freestyle individual
-- Cycling BMX - BMX individual

--- update Racing Individual
update olympics_medals_06
set Event = 'Racing Individual'
where discipline_title = 'Cycling BMX Racing'
 and Event is null



--- update Freestyle individual
update olympics_medals_06
set Event = 'Freestyle individuall'
where discipline_title = 'Cycling BMX Freestyle'
 and Event is null



 --- update BMX individual
update olympics_medals_06
set Event = 'BMX individual'
where discipline_title = 'Cycling BMX'
 and Event is null



-------------------------------- Cycling Road ---------------------
select distinct event_title
from olympics_medals_06
where Discipline = 'Cycling Road'

select *
from olympics_medals_06
where Discipline = 'Cycling Road'

--- update individual all-round
update olympics_medals_06
set Event = 'individual road race'
where Discipline = 'Cycling Road'
and (event_title like '%individual road race%' or event_title like '%Road Race%')
and Event is null


--- update individual all-round
update olympics_medals_06
set Event = 'individual time trial'
where Discipline = 'Cycling Road'
and (event_title like '%individual time trial%' or event_title like '%Individual Time Trial%')
and Event is null


-------------------------- Cycling Track ---------------------

select distinct event_title
from olympics_medals_06
where Discipline = 'Cycling Track'

select *
from olympics_medals_06
where Discipline = 'Cycling Track'


--- update Madison
update olympics_medals_06
set Event = 'Madison'
where Discipline = 'Cycling Track'
and event_title like '%Madison%' 
and Event is null

--- update Keirin
update olympics_medals_06
set Event = 'Madison'
where Discipline = 'Cycling Track'
and event_title like '%Keirin%' 
and Event is null



--- update Team Pursuit
update olympics_medals_06
set Event = 'Team Pursuit'
where Discipline = 'Cycling Track'
and event_title like '%Team Pursuit%' 
and Event is null

--- update Team Sprint
update olympics_medals_06
set Event = 'Team Sprint'
where Discipline = 'Cycling Track'
and event_title like '%Team Sprint%' 
and Event is null



--- update Team Sprint
update olympics_medals_06
set Event = 'Team Sprint'
where Discipline = 'Cycling Track'
and event_title like '%Team Sprint%' 
and Event is null



--- update Sprint
update olympics_medals_06
set Event = 'Sprint'
where Discipline = 'Cycling Track'
and event_title like '%Sprint%' 
and Event is null

--- update Omnium
update olympics_medals_06
set Event = 'Omnium'
where Discipline = 'Cycling Track'
and event_title like '%Omnium%' 
and Event is null



--------------- Cycling Mountain Bike ----------------

select distinct event_title
from olympics_medals_06
where Discipline = 'Cycling Mountain Bike'

select *
from olympics_medals_06
where Discipline = 'Cycling Mountain Bike'


--- update Omnium
update olympics_medals_06
set Event = 'cross-country'
where Discipline = 'Cycling Mountain Bike'
and event_title like '%cross-country%' 
and Event is null


----------------------------------------------------
select *
from olympics_medals_06
where Sport = 'Cycling'





























select *
from olympics_medals_06
where Discipline ='Cycling BMX'

and (event_title like '%pommel horse%' or event_title like '%Pommel Horse%')

event_title like '%800m freestyle%'
or event_title like '%800m Freestyle%'







































































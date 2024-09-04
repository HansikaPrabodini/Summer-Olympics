USE [olympics]

select *
from olympics_medals_06
where Sport = 'Cycling'

select *
from olympics_medals_06
where country_3_letter_code ='USA'
and medal_type ='SILVER'
and slug_game ='rio-2016'


select *
from olympics_medals_06
where country_3_letter_code ='USA'
and medal_type ='BRONZE'
and slug_game ='tokyo-2020'

select *
from olympics_medals_06
where country_3_letter_code ='CHN'
and slug_game ='tokyo-2020'
and medal_type ='GOLD'

-- create another copy of table 

select *
into olympics_medals_07
from olympics_medals_06


--------------------- Volleyball -----------------------
-------------------- Beach Volleyball -------------------------
select *
from olympics_medals_07
where Sport = 'Volleyball'
and Discipline ='Beach Volleyball'


select distinct event_title
from olympics_medals_07
where Sport = 'Volleyball'
and Discipline ='Beach Volleyball'

--- update beach volleyball
update olympics_medals_07
set Event = 'beach volleyball'
where Discipline = 'Beach Volleyball'
and Event is null

----------------- volleyball ---------------------------
select distinct event_title
from olympics_medals_07
where Sport = 'Volleyball'
and Discipline ='Volleyball'

--- update beach volleyball
update olympics_medals_07
set Event = 'volleyball'
where Discipline = 'Volleyball'
and Event is null


-------------------------- Wrestling ---------------------------
-------------------- Wrestling Free ------------------------------

select *
from olympics_medals_07
where Sport = 'Wrestling'
and Discipline ='Wrestling Free'
and event_gender = 'Women'

select distinct event_title
from olympics_medals_07
where Sport = 'Wrestling'
and Discipline ='Wrestling Free'
and event_gender = 'Men'


----------------- Wrestling Gre-R -------------------

select *
from olympics_medals_07
where Sport = 'Wrestling'
and Discipline ='Wrestling Gre-R'
and event_gender = 'Women'

select distinct event_title
from olympics_medals_07
where Sport = 'Wrestling'
and Discipline ='Wrestling Gre-R'
and event_gender = 'Men'



-- there are lot of modifications in history to present so now we can add event as event title 

update olympics_medals_07
set Event = event_title
where Sport = 'Wrestling'
and Event is null

-------------------- Football -----------------------
select distinct event_title
from olympics_medals_07
where Sport = 'Football'



update olympics_medals_07
set Event = 'football'
where Sport = 'Football'
and Event is null


select *
from olympics_medals_07
where Sport = 'Football'


---------------------------- Basketball-----------

select distinct event_title
from olympics_medals_07
where Sport = 'Basketball'

update olympics_medals_07
set Event = 'basketball'
where Sport = 'Basketball'
and Event is null


select *
from olympics_medals_07
where Sport = 'Basketball'

----------------------------- Hockey ----------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Hockey'

update olympics_medals_07
set Event = 'hockey'
where Sport = 'Hockey'
and Event is null


select *
from olympics_medals_07
where Sport = 'Hockey'


-------------------------- Handball ---------------

select distinct event_title
from olympics_medals_07
where Sport = 'Handball'

update olympics_medals_07
set Event = 'handball'
where Sport = 'Handball'
and Event is null


select *
from olympics_medals_07
where Sport = 'Handball'


--------------------------- Triathlon --------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Triathlon'

update olympics_medals_07
set Event = 'mixed relay'
where Sport = 'Triathlon'
and event_title like '%Mixed%'
and Event is null


update olympics_medals_07
set Event = 'Individual'
where Sport = 'Triathlon'
and event_title like '%Individual%'
and Event is null

select *
from olympics_medals_07
where Sport = 'Triathlon'



---------------------------- Badminton -----------
select distinct event_title
from olympics_medals_07
where Sport = 'Badminton'


update olympics_medals_07
set Event = 'singles'
where Sport = 'Badminton'
and event_title like '%singles%'
and Event is null


update olympics_medals_07
set Event = 'doubles'
where Sport = 'Badminton'
and event_title like '%doubles%'
and Event is null

select *
from olympics_medals_07
where Sport = 'Badminton'



------------------------ Softball ---------------

select distinct event_title
from olympics_medals_07
where Sport = 'Softball'

update olympics_medals_07
set Event = 'softball'
where Sport = 'Softball'
and Event is null

select *
from olympics_medals_07
where Sport = 'Softball'



-------------------------- Baseball -------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Baseball'

update olympics_medals_07
set Event = 'baseball'
where Sport = 'Baseball'
and Event is null

select *
from olympics_medals_07
where Sport = 'Baseball'


------------------------------ Canoe / Kayak -------------
----------------------- Canoe / Kayak F ------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'


-- update C-1 1000m (canoe single) 
update olympics_medals_07
set Event = 'C-1 1000m (canoe single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'C-1 1000m (canoe single) men' or event_title ='C1 1000m canoe single men' or event_title like '%Canoe Single 1000m%') 
and Event is null



-- update C-2 1000m (canoe double)
update olympics_medals_07
set Event = 'C-2 1000m (canoe double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'C-2 1000m (canoe double) men' or  event_title = 'C2 1000m canoe double men' or event_title like '%Canoe Double 1000m%') 
and Event is null



-- update K-1 1000m (kayak single)
update olympics_medals_07
set Event = 'K-1 1000m (kayak single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-1 1000m (kayak single) men' or  event_title = 'K1 1000m kayak single men' or event_title like '%Kayak Single 1000m%') 
and Event is null




-- update K-2 1000m (kayak double)
update olympics_medals_07
set Event = 'K-2 1000m (kayak double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-2 1000m (kayak double) men' or  event_title = 'K2 1000m kayak double men' or event_title like '%Kayak Double 1000m%') 
and Event is null


-- update K-2 500m (kayak double)
update olympics_medals_07
set Event = 'K-2 500m (kayak double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-2 500m (kayak double) women' or  event_title = 'K2 500m kayak double women' or event_title like '%Kayak Double 500m%') 
and Event is null



-- update K-4 1000m (kayak four)
update olympics_medals_07
set Event = 'K-4 1000m (kayak four)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-4 1000m (kayak four) men' or  event_title = 'K4 1000m kayak four men' ) 
and Event is null





-- update K-4 500m (kayak four)
update olympics_medals_07
set Event = 'K-4 500m (kayak four)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-4 500m (kayak four) women' or  event_title = 'K4 500m kayak four women' or event_title like '%Kayak Four 500m%' ) 
and Event is null


-- update K-1 500m (kayak single)
update olympics_medals_07
set Event = 'K-1 500m (kayak single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title = 'K-1 500m (kayak single) women' or event_title like '%Kayak Single 500m%' ) 
and Event is null



-- update C-2 500m (canoe double)
update olympics_medals_07
set Event = 'C-2 500m (canoe double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and event_title like '%Canoe Double 500m%' 
and Event is null



-- update K-1 200m (kayak single
update olympics_medals_07
set Event = 'K-1 200m (kayak single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and (event_title = 'K-1 200m (kayak single) men' or event_title = 'K-1 200m (kayak single) women' or event_title like '%Kayak Single 200m%' ) 

-- update C-1 200m (canoe single)
update olympics_medals_07
set Event = 'C-1 200m (canoe single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title ='C-1 200m (canoe single) men' or event_title like '%Canoe Single 200m%')
and Event is null




-- update K-2 200m (kayak double)
update olympics_medals_07
set Event = 'K-2 200m (kayak double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'
and ( event_title ='K-2 200m (kayak double) men' or event_title = 'K2 200m kayak double men')
and Event is null


select *
from olympics_medals_07
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak F'


----------------------- Canoe / Kayak F ------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak S'

-- update C-1 (canoe single)
update olympics_medals_07
set Event = 'C-1 (canoe single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak S'
and ( event_title ='C-1 (canoe single) men' or event_title = 'C1 canoe single men' or event_title like '%Canoe%')
and Event is null




-- update K-1 (kayak single)
update olympics_medals_07
set Event = 'K-1 (kayak single)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak S'
and ( event_title like '%(kayak single)%' or event_title like '%kayak single%' or event_title like '%Kayak%')
and Event is null



-- update C-2 (canoe double)
update olympics_medals_07
set Event = 'C-2 (canoe double)'
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak S'
and ( event_title ='C-2 (canoe double) men' or event_title ='C2 canoe double men')
and Event is null

select *
from olympics_medals_07
where Sport = 'Canoe / Kayak'
and Discipline = 'Canoe / Kayak S'



--------------- Fencing ----------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Fencing'

-- update foil individual
update olympics_medals_07
set Event = 'foil individual'
where Sport = 'Fencing'
and ( event_title ='foil individual men' or event_title ='foil individual women' or event_title like '%Foil Individual%')
and Event is null


-- update foil team
update olympics_medals_07
set Event = 'foil team'
where Sport = 'Fencing'
and ( event_title ='foil team men' or event_title ='foil team women' or event_title like '%Foil Team%')
and Event is null


-- update sabre individual
update olympics_medals_07
set Event = 'sabre individual'
where Sport = 'Fencing'
and ( event_title ='sabre individual men' or event_title ='sabre individual women' or event_title like '%Sabre Individual%')
and Event is null


-- update sabre team
update olympics_medals_07
set Event = 'sabre individual'
where Sport = 'Fencing'
and ( event_title ='sabre team men' or event_title ='sabre team women' or event_title like '%Sabre Team%')
and Event is null


-- update épée individual
update olympics_medals_07
set Event = 'épée individual'
where Sport = 'Fencing'
and ( event_title ='Ã©pÃ©e individual men' or event_title ='Ã©pÃ©e individual women' or event_title like '%Ã‰pÃ©e Individual%')
and Event is null



-- update épée team
update olympics_medals_07
set Event = 'épée team'
where Sport = 'Fencing'
and ( event_title ='Ã©pÃ©e team men' or event_title ='Ã©pÃ©e team women' or event_title like '%Ã‰pÃ©e Team%')
and Event is null


select *
from olympics_medals_07
where Sport = 'Fencing'


---------------------------------- Archery --------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Archery'

-- update individual (FITA Olympic round - 70m)
update olympics_medals_07
set Event = 'individual (FITA Olympic round - 70m)'
where Sport = 'Archery'
and ( event_title ='individual FITA Olympic round  70m men' or event_title ='individual FITA Olympic round  70m women' )
and Event is null

-- update team (FITA Olympic round - 70m)
update olympics_medals_07
set Event = 'team (FITA Olympic round - 70m)'
where Sport = 'Archery'
and ( event_title ='team FITA Olympic round  70m men' or event_title ='team FITA Olympic round  70m women' )
and Event is null


-- update individual FITA round
update olympics_medals_07
set Event = 'individual FITA round'
where Sport = 'Archery'
and ( event_title ='Individual competition men' or event_title ='Individual Competition women' or event_title like '%Individual%' )
and Event is null


-- update teams FITA round
update olympics_medals_07
set Event = 'teams FITA round'
where Sport = 'Archery'
and ( event_title ='team competition men' or event_title ='team competition women' or event_title like '%Team%' )
and Event is null

-- update Mixed Team
update olympics_medals_07
set Event = 'Mixed Team'
where Sport = 'Archery'
and event_title ='Mixed Team'


select *
from olympics_medals_07
where Sport = 'Archery'



--------------------------- Tennis ------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Tennis'

-- update mixed
update olympics_medals_07
set Event = 'mixed'
where Sport = 'Tennis'
and event_title like '%mixed%'

-- update singles
update olympics_medals_07
set Event = 'singles'
where Sport = 'Tennis'
and event_title like '%singles%'
and Event is null


-- update doubles
update olympics_medals_07
set Event = 'doubles'
where Sport = 'Tennis'
and event_title like '%doubles%'
and Event is null

select *
from olympics_medals_07
where Sport = 'Tennis'


---------------------------------------- Modern Pentathlon --------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Modern Pentathlon'

-- update individual
update olympics_medals_07
set Event = 'individual'
where Sport = 'Modern Pentathlon'
and event_title like '%individual%'
and Event is null


select *
from olympics_medals_07
where Sport = 'Modern Pentathlon'


----------------------------------------- Judo -------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Judo'

-- update - 48kg (extra-lightweight)
update olympics_medals_07
set Event = '- 48kg (extra-lightweight)'
where Sport = 'Judo'
and (event_title like '%-48 kg women%' or event_title like '%Women -48 kg%')
and Event is null

-- update 48 - 52kg (half-lightweight)
update olympics_medals_07
set Event = '48 - 52kg (half-lightweight)'
where Sport = 'Judo'
and (event_title like '%48 - 52kg (half-lightweight) women%' or event_title like '%48  52kg halflightweight women%'  or event_title like '%Women -52 kg%')
and Event is null

-- update 52 - 57kg (lightweight)
update olympics_medals_07
set Event = '52 - 57kg (lightweight)'
where Sport = 'Judo'
and (event_title like '%52  57kg lightweight women%' or event_title like '%Women -57 kg%' )
and Event is null

-- update 57 - 63kg (half-middleweight)
update olympics_medals_07
set Event = '57 - 63kg (half-middleweight)'
where Sport = 'Judo'
and (event_title like '%57 - 63kg (half-middleweight) women%' or event_title like '%Women -63 kg%' )
and Event is null


-- update 63 - 70kg (middleweight)
update olympics_medals_07
set Event = '63 - 70kg (middleweight)'
where Sport = 'Judo'
and (event_title like '%63  70kg middleweight women%' or event_title like '%Women -70 kg%' )
and Event is null

-- update70 - 78kg (half-heavyweight)
update olympics_medals_07
set Event = '70 - 78kg (half-heavyweight)'
where Sport = 'Judo'
and (event_title like '%70 - 78kg (half-heavyweight) women%' or event_title like '%70  78kg halfheavyweight women%' or event_title like '%Women -78 kg%' )
and Event is null

-- update + 78kg (heavyweight)
update olympics_medals_07
set Event = '+ 78kg (heavyweight)'
where Sport = 'Judo'
and (event_title like '%78kg heavyweight women%' or event_title like '%Women +78 kg%' or event_title like '%+ 78kg (heavyweight) women%' )
and Event is null

--need it do for men 
-- update - 60kg (extra-lightweight)

update olympics_medals_07
set Event = '- 60kg (extra-lightweight)'
where Sport = 'Judo'
and (event_title like '%60 kg men%' or event_title like '%Men -60 kg%')
and Event is null


-- update 60 - 66kg (half-lightweight)
update olympics_medals_07
set Event = '60 - 66kg (half-lightweight)'
where Sport = 'Judo'
and (event_title like '%60 - 66kg (half-lightweight) men%' or event_title like '%60  66kg halflightweight men%'  or event_title like '%Men -66 kg%')
and Event is null


-- update 66 - 73kg (lightweight)
update olympics_medals_07
set Event = '66 - 73kg (lightweight)'
where Sport = 'Judo'
and (event_title like '%66  73kg lightweight men%' or event_title like '%Men -73 kg%' )
and Event is null


-- update 73 - 81kg (half-middleweight)
update olympics_medals_07
set Event = '73 - 81kg (half-middleweight)'
where Sport = 'Judo'
and (event_title like '%73 - 81kg (half-middleweight) men%' or event_title like '%Men -81 kg%' )
and Event is null

-- update 81 - 90kg (middleweight)
update olympics_medals_07
set Event = '81 - 90kg (middleweight)'
where Sport = 'Judo'
and (event_title like '%81  90kg middleweight men%' or event_title like '%Men -90 kg%' )
and Event is null

-- update 90 - 100kg (half-heavyweight)
update olympics_medals_07
set Event = '90 - 100kg (half-heavyweight)'
where Sport = 'Judo'
and (event_title like '%90  100kg halfheavyweight men%' or event_title like '%90 - 100kg (half-heavyweight) men%' or event_title like '%Men -100 kg%' )
and Event is null

-- update + 100kg (heavyweight)
update olympics_medals_07
set Event = '+ 100kg (heavyweight)'
where Sport = 'Judo'
and (event_title like '%100kg heavyweight men%' or event_title like '%Men +100 kg%' or event_title like '%100kg (heavyweight) men%' )
and Event is null


-- update Mixed Team
update olympics_medals_07
set Event = 'Mixed Team'
where Sport = 'Judo'
and event_title like '%Mixed Team%' 
and Event is null



select *
from olympics_medals_07
where Sport = 'Judo'

---------------------------------------- Sailing -------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Sailing'

-- update Laser - One Person Dinghy
update olympics_medals_07
set Event = 'Laser - One Person Dinghy'
where Sport = 'Sailing'
and (event_title like '%Laser - One Person Dinghy men%' or event_title like '%Laser Men%')
and Event is null

-- update Laser - One Person Dinghy
update olympics_medals_07
set Event = 'Laser - One Person Dinghy'
where Sport = 'Sailing'
and (event_title like '%Laser Radial - One Person Dinghy women%' or event_title like '%Laser Radial Women%')
and Event is null

-- update 470 - Two Person Dinghy
update olympics_medals_07
set Event = '470 - Two Person Dinghy'
where Sport = 'Sailing'
and event_title like '%470%'
and Event is null

-- update 49er - Skiff
update olympics_medals_07
set Event = '49er - Skiff'
where Sport = 'Sailing'
and event_title like '%49%'
and Event is null

-- update RS:X - Windsurfer
update olympics_medals_07
set Event = 'RS:X - Windsurfer'
where Sport = 'Sailing'
and event_title like '%RS%'
and Event is null

-- update Tornado - Multihull
update olympics_medals_07
set Event = 'Tornado - Multihull'
where Sport = 'Sailing'
and event_title like '%Nacra %'
and Event is null

-- update Star - Keelboat
update olympics_medals_07
set Event = 'Star - Keelboat'
where Sport = 'Sailing'
and ( event_title like '%Star - Keelboat%' or event_title like '%Elliott 6m%')
and Event is null

-- updateFinn - Heavyweight Dinghy
update olympics_medals_07
set Event = 'Finn - Heavyweight Dinghy'
where Sport = 'Sailing'
and event_title like '%Finn%'
and Event is null


select *
from olympics_medals_07
where Sport = 'Sailing'


---------------------------------------- Table Tennis -------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Table Tennis'

-- update singles
update olympics_medals_07
set Event = 'singles'
where Sport = 'Table Tennis'
and event_title like '%singles%'
and Event is null


-- update team
update olympics_medals_07
set Event = 'team'
where Sport = 'Table Tennis'
and event_title like '%team%'
and Event is null


-- update doubles
update olympics_medals_07
set Event = 'doubles'
where Sport = 'Table Tennis'
and event_title like '%doubles%'
and Event is null


select *
from olympics_medals_07
where Sport = 'Table Tennis'


---------------------------------------- Rowing -------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Rowing'

-- update single sculls (1x)
update olympics_medals_07
set Event = 'single sculls (1x)'
where Sport = 'Rowing'
and  event_title like '%Single Sculls%'
and Event is null

-- update lightweight double sculls (2x)
update olympics_medals_07
set Event = 'lightweight double sculls (2x)'
where Sport = 'Rowing'
and  ( event_title like '%lightweight double sculls 2x%' or event_title ='Lightweight Men''s Double Sculls' or event_title ='Lightweight Women''s Double Sculls' )
and Event is null



-- update quadruple sculls without coxswain (4x)
update olympics_medals_07
set Event = 'quadruple sculls without coxswain (4x)'
where Sport = 'Rowing'
and (event_title like '%lquadruple sculls without coxswain (4x)%' or event_title like '%quadruple sculls%')
and Event is null


-- update double sculls (2x)
update olympics_medals_07
set Event = 'double sculls (2x)'
where Sport = 'Rowing'
and event_title like '%Double Sculls%'
and Event is null


-- update four without coxswain (4-)
update olympics_medals_07
set Event = 'four without coxswain (4-)'
where Sport = 'Rowing'
and event_title like '%four without coxswain 4 men%'
and Event is null

-- update eight with coxswain (8+)
update olympics_medals_07
set Event = 'eight with coxswain (8+)'
where Sport = 'Rowing'
and (event_title like '%eight with coxswain 8%' or event_title like '%eight%')
and Event is null

-- update lightweight coxless four (4-)
update olympics_medals_07
set Event = 'lightweight coxless four (4-)'
where Sport = 'Rowing'
and(event_title like '%lightweight coxless four 4%' or event_title like '%four%')
and Event is null

-- update pair without coxswain (2-)
update olympics_medals_07
set Event = 'pair without coxswain (2-)'
where Sport = 'Rowing'
and (event_title like '%pair without coxswain 2%' or event_title like '%pair without coxswain 2 men%' or event_title ='Men''s Pair' or event_title ='Women''s Pair' )
and Event is null



select *
from olympics_medals_07
where Sport = 'Rowing'



---------------------------------------- Shooting -------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Shooting'

-- update 10m air pistol (40 shots)
update olympics_medals_07
set Event = '10m air pistol (40 shots)'
where Sport = 'Shooting'
and event_title ='10m Air Pistol Mixed Team'
and Event is null

-- update 10m air pistol (60 shots)
update olympics_medals_07
set Event = '10m air pistol (60 shots)'
where Sport = 'Shooting'
and ( event_title ='10m air pistol 60 shots men' or event_title like '%10m Air Pistol%')
and Event is null

-- update 10m air rifle (60 shots)
update olympics_medals_07
set Event = '10m air rifle (60 shots)'
where Sport = 'Shooting'
and event_title ='10m Air Rifle Mixed Team'
and Event is null


-- update 10m air rifle (60 shots)
update olympics_medals_07
set Event = '10m air rifle (60 shots)'
where Sport = 'Shooting'
and ( event_title ='10m air rifle 60 shots men' or event_title like '%10m Air Rifle%')
and Event is null

-- update 25m pistol (30+30 shots)
update olympics_medals_07
set Event = '25m pistol (30+30 shots)'
where Sport = 'Shooting'
and ( event_title ='25m pistol 3030 shots women' or event_title like '%25m pistol%')
and Event is null

-- update 25m rapid fire pistol (60 shots)
update olympics_medals_07
set Event = '25m rapid fire pistol (60 shots)'
where Sport = 'Shooting'
and ( event_title ='25m rapid fire pistol 60 shots men' or event_title like '%25m rapid fire pistol%')
and Event is null


-- update 50m pistol (60 shots)
update olympics_medals_07
set Event = '50m pistol (60 shots)'
where Sport = 'Shooting'
and event_title ='50m pistol 60 shots men' 
and Event is null

-- update 50m rifle 3 positions (3x40 shots)
update olympics_medals_07
set Event = '50m rifle 3 positions (3x40 shots)'
where Sport = 'Shooting'
and ( event_title ='50m rifle 3 positions 3x40 shots men' or  event_title like'%50m Rifle 3 Positions%' or event_title ='%50m Rifle 3 Positions Women') 
and Event is null

-- update 50m rifle prone (60 shots)
update olympics_medals_07
set Event = '50m rifle prone (60 shots)'
where Sport = 'Shooting'
and event_title ='50m rifle prone 60 shots men' 
and Event is null

-- update double trap (150 targets)
update olympics_medals_07
set Event = 'double trap (150 targets)'
where Sport = 'Shooting'
and event_title ='double trap 150 targets men' 
and Event is null

-- update trap (125 targets)
update olympics_medals_07
set Event = 'trap (125 targets)'
where Sport = 'Shooting'
and ( event_title ='trap 125 targets men' or event_title ='Trap women'  or event_title ='Trap Men' )
and Event is null

-- update Trap Mixed
update olympics_medals_07
set Event = 'Trap Mixed'
where Sport = 'Shooting'
and event_title ='Trap Mixed Team' 
and Event is null

-- update skeet (125 targets)
update olympics_medals_07
set Event = 'skeet (125 targets)'
where Sport = 'Shooting'
and event_title like '%skeet%' 
and Event is null

select *
from olympics_medals_07
where Sport = 'Shooting'






---------------------Taekwondo ---------------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Taekwondo'

--for women
-- update - 49 kg
update olympics_medals_07
set Event = '- 49 kg'
where Sport = 'Taekwondo'
and ( event_title like '%- 49 kg%' or event_title like '%-49kg%' or event_title like '%49 kg women%'  )
and Event is null

-- update 49 - 57 kg
update olympics_medals_07
set Event = '49 - 57 kg'
where Sport = 'Taekwondo'
and ( event_title like '%49 - 57 kg women%' or event_title like '%Women -57kg%'  )
and Event is null

--update 57 - 67 kg
update olympics_medals_07
set Event = '57 - 67 kg'
where Sport = 'Taekwondo'
and ( event_title like '%57 - 67 kg women%' or event_title like '%Women -67kg%'  )
and Event is null


--update + 67 kg
update olympics_medals_07
set Event = '+ 67 kg'
where Sport = 'Taekwondo'
and ( event_title like '%+ 67 kg women%' or event_title like '%Women +67kg%' or event_title like '%67 kg women%'  )
and Event is null


--for men
-- update - 58 kg
update olympics_medals_07
set Event = '- 58 kg'
where Sport = 'Taekwondo'
and ( event_title like '%- 58 kg men%' or event_title like '%58 kg men%' or event_title like '%Men -58kg%'  )
and Event is null

-- update 58 - 68 kg
update olympics_medals_07
set Event = '58 - 68 kg'
where Sport = 'Taekwondo'
and ( event_title like '%58 - 68 kg men%' or event_title like '%Men -68kg%'  )
and Event is null

--update 68 - 80 kg
update olympics_medals_07
set Event = '68 - 80 kg'
where Sport = 'Taekwondo'
and ( event_title like '%68 - 80 kg men%' or event_title like '%Men -80kg%'  )
and Event is null


--update + 80 kg
update olympics_medals_07
set Event = '+ 80 kg'
where Sport = 'Taekwondo'
and ( event_title like '%+ 80 kg men%' or event_title like '%80 kg men%' or event_title like '%Men +80kg%'  )
and Event is null




select *
from olympics_medals_07
where Sport = 'Taekwondo'



-------------------------- Athletics -------------------------------

select distinct event_title
from olympics_medals_07
where Sport = 'Athletics'


--update discus throw
update olympics_medals_07
set Event = 'discus throw'
where Sport = 'Athletics'
and ( event_title like '%discus throw%' or event_title like '%Discus Throw%' )
and Event is null


--update hammer throw
update olympics_medals_07
set Event = 'hammer throw'
where Sport = 'Athletics'
and ( event_title like '%hammer throw%' or event_title like '%Hammer Throw%' )
and Event is null


--update high jump
update olympics_medals_07
set Event = 'high jump'
where Sport = 'Athletics'
and ( event_title like '%high jump%' or event_title like '%High Jump%' )
and Event is null

--update long jump
update olympics_medals_07
set Event = 'long jump'
where Sport = 'Athletics'
and ( event_title like '%long jump%' or event_title like '%Long Jump%' )
and Event is null

--update javelin throw
update olympics_medals_07
set Event = 'javelin throw'
where Sport = 'Athletics'
and ( event_title like '%javelin throw%' or event_title like '%Javelin Throw%' )
and Event is null



--update marathon
update olympics_medals_07
set Event = 'marathon'
where Sport = 'Athletics'
and ( event_title like '%marathon%' or event_title like '%Marathon%' )
and Event is null


--update pole vault
update olympics_medals_07
set Event = 'pole vault'
where Sport = 'Athletics'
and ( event_title like '%Pole Vault%' or event_title like '%pole vault%' )
and Event is null

--update shot put
update olympics_medals_07
set Event = 'shot put'
where Sport = 'Athletics'
and ( event_title like '%shot put%' or event_title like '%Shot Put%' )
and Event is null


--update triple jump
update olympics_medals_07
set Event = 'triple jump'
where Sport = 'Athletics'
and ( event_title like '%triple jump%' or event_title like '%Triple Jump%' )
and Event is null


--update decathlon
update olympics_medals_07
set Event = 'decathlon'
where Sport = 'Athletics'
and ( event_title like '%decathlon%' or event_title like '%Decathlon%' )
and Event is null


--update heptathlon
update olympics_medals_07
set Event = 'heptathlon'
where Sport = 'Athletics'
and ( event_title like '%heptathlon%' or event_title like '%Heptathlon%' )
and Event is null


-- now part in pentathlon modern 
--update pentathlon
----update olympics_medals_07
----set Event = 'pentathlon'
----where Sport = 'Athletics'
----and ( event_title like '%pentathlon%' or event_title like '%Heptathlon%' )
----and Event is null

--update 4x100m relay
update olympics_medals_07
set Event = '4x100m relay'
where Sport = 'Athletics'
and ( event_title like '%4x100m relay%' or event_title like '%4 x 100m Relay%' )
and Event is null

--update 100m
update olympics_medals_07
set Event = '100m'
where Sport = 'Athletics'
and ( event_title = '100m men' or event_title = '100m women' or event_title = 'Men''s 100m' or event_title = 'Women''s 100m'  )
and Event is null




--update 200m
update olympics_medals_07
set Event = '200m'
where Sport = 'Athletics'
and ( event_title = '200m men' or event_title = '200m women' or event_title = 'Men''s 200m' or event_title = 'Women''s 200m'  )
and Event is null


select *
from olympics_medals_07
where slug_game ='tokyo-2020'
and Event ='100m'

--update 400m
update olympics_medals_07
set Event = '400m'
where Sport = 'Athletics'
and ( event_title = '400m men' or event_title = '400m women' or event_title = 'Men''s 400m' or event_title = 'Women''s 400m'  )
and Event is null


--update 800m
update olympics_medals_07
set Event = '800m'
where Sport = 'Athletics'
and ( event_title = '800m men' or event_title = '800m women' or event_title = 'Men''s 800m' or event_title = 'Women''s 800m'  )
and Event is null



--update 10000m
update olympics_medals_07
set Event = '10000m'
where Sport = 'Athletics'
and ( event_title = '10000m men' or event_title = '10000m women' or event_title = 'Men''s 10,000m' or event_title = 'Women''s 10,000m'  )
and Event is null


--update 5000m
update olympics_medals_07
set Event = '5000m'
where Sport = 'Athletics'
and ( event_title = '5000m men' or event_title = '5000m women' or event_title = 'Men''s 5000m' or event_title = 'Women''s 5000m'  )
and Event is null

--update 1500m
update olympics_medals_07
set Event = '1500m'
where Sport = 'Athletics'
and ( event_title = '1500m men' or event_title = '1500m women' or event_title = 'Men''s 1500m' or event_title = 'Women''s 1500m'  )
and Event is null


--update 100m hurdles
update olympics_medals_07
set Event = '100m hurdles'
where Sport = 'Athletics'
and ( event_title = '100m hurdles women' or event_title = 'Women''s 100m Hurdles' )
and Event is null


--update 110m hurdles
update olympics_medals_07
set Event = '110m hurdles'
where Sport = 'Athletics'
and ( event_title = '110m hurdles men' or event_title = 'Men''s 110m Hurdles' )
and Event is null



--update 4x400m relay
update olympics_medals_07
set Event = '4x400m relay'
where Sport = 'Athletics'
and ( event_title = '4x400m relay men' or event_title = '4x400m relay women' or event_title = 'Men''s 4 x 400m Relay' or event_title = 'Women''s 4 x 400m Relay'  )
and Event is null



--update 400m hurdles
update olympics_medals_07
set Event = '400m hurdles'
where Sport = 'Athletics'
and ( event_title = '400m hurdles men' or event_title = '400m hurdles women' or event_title = 'Men''s 400m Hurdles' or event_title = 'Women''s 400m Hurdles'  )
and Event is null


--update 20km walk
update olympics_medals_07
set Event = '20km walk'
where Sport = 'Athletics'
and ( event_title like '%20km%'  )
and Event is null



--update 3000m steeplechase
update olympics_medals_07
set Event = '3000m steeplechase'
where Sport = 'Athletics'
and ( event_title like '%3000m steeplechase%'  )
and Event is null

--added mixed 
--update 4 x 400m Relay Mixed
update olympics_medals_07
set Event = '4 x 400m Relay Mixed'
where Sport = 'Athletics'
and event_title like '%4 x 400m Relay Mixed%' 
and Event is null

select *
from olympics_medals_07


---------------------------- Skateboarding-----------
select *
from olympics_medals_07

update olympics_medals_07
set Event = 'Park'
where Sport = 'Skateboarding'
and event_title like '%Park%' 
and Event is null

update olympics_medals_07
set Event = 'Street'
where Sport = 'Skateboarding'
and event_title like '%Street%' 
and Event is null


---------------------------- Basketball-----------
select *
from olympics_medals_07
where Sport ='Basketball'

update olympics_medals_07
set Discipline = '3x3 Basketball'
where Sport = 'Basketball'
and discipline_title ='3x3 Basketball'
and Event is null

---------------------now want get another copy of table

select *
into olympics_medals_11
from olympics_medals_07


select *
from olympics_medals_11

select *
from olympics_medals_11
where slug_game ='tokyo-2020'
and Event ='100m'

-- create new column call Medal
alter table olympics_medals_11
add Medal varchar(255)

--update as only first letter upper case others are lower case
update olympics_medals_11
set Medal = concat(upper(substring(medal_type, 1, 1)), lower(substring(medal_type, 2)))

UPDATE olympics_medals_11
SET Medal = upper(left(medal_type, 1)) + lower(substring(medal_type, 2, len(medal_type)));



---------------- get event_gender as --------------
--W
--X
--M

select distinct event_gender
from olympics_medals_11
--Women -W
--Mixed - X
--Men - M
--Open - X

--add new column E_gender
alter table olympics_medals_11
add E_gender varchar(255)

update olympics_medals_11
set E_gender ='W'
where event_gender = 'Women'


update olympics_medals_11
set E_gender ='M'
where event_gender = 'Men'


update olympics_medals_11
set E_gender ='X'
where event_gender = 'Mixed'
or event_gender = 'Open'

select *
from olympics_medals_11


-- add new column C_code 
alter table olympics_medals_11
add C_code varchar(255)

update olympics_medals_11
set C_code = country_3_letter_code


-- SELECT column1, column2, column3
--INTO new_table_name
--FROM existing_table_name


------now again move into events 
----------------------- Boxing --
select distinct event_title
from olympics_medals_11
where Sport = 'Boxing'

--update Flyweight (up to 51 kg)
update olympics_medals_11
set Event = 'Flyweight (up to 51 kg)'
where (event_title = 'Women''s Fly (48-51kg)' or event_title ='51 kg fly women')
and Event is null

--update Featherweight (up to 57 kg)
update olympics_medals_11
set Event = 'Featherweight (up to 57 kg)'
where (event_title = 'Women''s Feather (54-57kg)' )
and Event is null

--update Lightweight (up to 60 kg)
update olympics_medals_11
set Event = 'Lightweight (up to 60 kg)'
where (event_title = 'Women''s Light (57-60kg)' or event_title ='60 kg light women') 
and Event is null

--update Welterweight (up to 69 kg)
update olympics_medals_11
set Event = 'Welterweight (up to 69 kg)'
where (event_title = 'Women''s Welter (64-69kg)' ) 
and Event is null


--update Middleweight (up to 75 kg)
update olympics_medals_11
set Event = 'Middleweight (up to 75 kg)'
where (event_title = 'Women''s Middle (69-75kg)' or event_title ='75 kg middle women') 
and Event is null

--for men 

--update Flyweight (up to 52 kg)
update olympics_medals_11
set Event = 'Flyweight (up to 52 kg)'
where (event_title = 'Men''s Fly (48-52kg)' or event_title ='52kg men' or event_title ='46-49kg men')
and Event is null

--update Featherweight (up to 57 kg)
update olympics_medals_11
set Event = 'Featherweight (up to 57 kg)'
where (event_title = 'Men''s Feather (52-57kg)' or event_title ='56kg men')
and Event is null

--update Lightweight (up to 63 kg)
update olympics_medals_11
set Event = 'Lightweight (up to 63 kg)'
where (event_title = 'Men''s Light (57-63kg)' or event_title ='57-60kg lightweight men' or event_title ='60 - 64 kg men')
and Event is null

--update Welterweight (up to 69 kg)
update olympics_medals_11
set Event = 'Welterweight (up to 69 kg)'
where (event_title = 'Men''s Welter (63-69kg)' or event_title ='64 - 69 kg men')
and Event is null


--update Middleweight (up to 75 kg)
update olympics_medals_11
set Event = 'Middleweight (up to 75 kg)'
where (event_title = 'Men''s Middle (69-75kg)' or event_title ='69 - 75 kg men' )
and Event is null


--update Light Heavyweight (up to 81 kg)
update olympics_medals_11
set Event = 'Light Heavyweight (up to 81 kg)'
where (event_title = 'Men''s Light Heavy (75-81kg)' or event_title ='75 - 81kg (light-heavyweight) men' or event_title ='75-81kg lightheavyweight men')
and Event is null

--update Heavyweight (up to 91 kg)
update olympics_medals_11
set Event = 'Heavyweight (up to 91 kg)'
where (event_title = 'Men''s Heavy (81-91kg)' or event_title ='81-91kg heavyweight men' )
and Event is null


--update Super Heavyweight (over 91 kg)
update olympics_medals_11
set Event = 'Heavyweight (up to 91 kg)'
where (event_title = 'Men''s Super Heavy (+91kg)' or event_title ='+ 91kg (super heavyweight) men' )
and Event is null

select *
from olympics_medals_11
where Sport = 'Boxing'


------------------------------ weightlifting --

select distinct event_title
from olympics_medals_11
where Sport = 'Weightlifting'

update olympics_medals_11
set Event = event_title
where Sport = 'Weightlifting'

select *
from olympics_medals_11
where Sport = 'Weightlifting'

--------------------------------golf ----------------
select distinct event_title
from olympics_medals_11
where Sport = 'Golf'

update olympics_medals_11
set Event = event_title
where Sport = 'Golf'

select *
from olympics_medals_11
where Sport = 'Golf'



-------------------------------- rugby -- 
--The rugby event in the Olympics before that was in 1900, and it was only in the 2016 Rio de Janeiro Olympics that rugby was reintroduced, specifically in the form of Rugby Sevens.
select distinct event_title
from olympics_medals_11
where Sport = 'Rugby'

update olympics_medals_11
set Event = event_title
where Sport = 'Rugby'

select *
from olympics_medals_11
where Sport = 'Rugby'


--------------------------------- karate --
--Karate was introduced as an Olympic sport for the first time at the Tokyo 2020 Summer Olympics.
select distinct event_title
from olympics_medals_11
where Sport = 'Karate'

update olympics_medals_11
set Event = event_title
where Sport = 'Karate'

select *
from olympics_medals_11
where Sport = 'Karate'

-----------------Surfing -----------------------

update olympics_medals_11
set Event = event_title
where Sport = 'Surfing'

select *
from olympics_medals_11
where Year = '2020'
and Event ='100m'

select City , Year , Sport ,Discipline , Event ,athlete_full_name,  C_code, country_name  , E_gender , Medal
into olympics_medals_12
from olympics_medals_11

select *
from olympics_medals_12



select *
from olympics_medals_12
where Year = '2020'
and Event ='100m'
and E_gender ='M'
--------------------------------------------------------------------------------------------------------------------------------
--- want rename this columns same as olympics_76_05 
--athlete_full_name - Athlete
EXEC sp_rename 'olympics_medals_12.athlete_full_name', 'Athlete', 'COLUMN'
--C_code - Country_Code 
EXEC sp_rename 'olympics_medals_12.C_code', 'Country_Code', 'COLUMN'
--country_name - Country
EXEC sp_rename 'olympics_medals_12.country_name', 'Country', 'COLUMN'
--E_gender - Event_gender
EXEC sp_rename 'olympics_medals_12.E_gender', 'Event_gender', 'COLUMN'
--syntax 
--EXEC sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';






---------------------wrong ------------------------------
--- Now want to combine olympics_medals_10 and olympics_76_05 together 


SELECT City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal
INTO combined_olympics_medals
FROM olympics_medals_12

UNION 

SELECT City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal
FROM olympics_76_05

----------------------------------------------------------------------------------------------------------------
--- now use combined_olympics_medals
select *
from combined_olympics_medals

select *
from combined_olympics_medals
where Year = '2020'
and Event ='100m'
and Event_gender ='M'

select *
from combined_olympics_medals
where Event_gender is null

--- need to check country 
select distinct Country 
from combined_olympics_medals

select *
from combined_olympics_medals
where Country like '%United States%'

--copy of combined_olympics_medals
select *
into combined_olympics_medals_01
from combined_olympics_medals

--update United States of America
update combined_olympics_medals_01
set Country = 'United States of America'
where Country like '%United States%'



select distinct Country 
from combined_olympics_medals_01

--Netherlands Antilles* , Netherlands
select *
from combined_olympics_medals_01
where Country like '%Netherlands%'

update combined_olympics_medals_01
set Country = 'Netherlands'
where Country like '%Netherlands%'


---------------------------------------
select *
from combined_olympics_medals_01
where Country like '%Korea%'

--PRK -Korea, North, Democratic People's Republic of Korea
--KOR - Korea, South , Republic of Korea

update combined_olympics_medals_01
set Country = 'Republic of Korea'
where Country_Code = 'KOR'


update combined_olympics_medals_01
set Country = 'Democratic People''s Republic of Korea'
where Country_Code = 'PRK'


---------------------------------Cote d'Ivoire,CÃ´te d'Ivoire
--The IOC country code CIV represents Côte d'Ivoire, commonly known as the Ivory Coast
select *
from combined_olympics_medals_01
where Country like '%CÃ´te d''Ivoire%'

select *
from combined_olympics_medals_01
where Country_Code = 'CIV'

update combined_olympics_medals_01
set Country = 'Côte d''Ivoire'
where Country_Code = 'CIV'


------------------------------------------China , People's Republic of China
--The IOC country code CHN represents China.
select *
from combined_olympics_medals_01
where Country like '%China%'

select *
from combined_olympics_medals_01
where Country_Code = 'CHN'

update combined_olympics_medals_01
set Country = 'China'
where Country_Code = 'CHN'

----------------------------------------------------------Bermuda , Bermuda*--BER
update combined_olympics_medals_01
set Country = 'Bermuda'
where Country_Code = 'BER'


--------------------------------------------------Hong Kong* , Hong Kong, China-HKG

update combined_olympics_medals_01
set Country = 'Hong Kong'
where Country_Code = 'HKG'

-----------------------------------------------Iran , Islamic Republic of Iran - IRI
update combined_olympics_medals_01
set Country = 'Islamic Republic of Iran'
where Country_Code = 'IRI'

----------------------------------------------Moldova , Republic of Moldova - MDA
update combined_olympics_medals_01
set Country = 'Moldova'
where Country_Code = 'MDA'

-----------------------------------------------Macedonia , North Macedonia - MKD 
update combined_olympics_medals_01
set Country = 'Macedonia'
where Country_Code = 'MKD'

------------------------------------------------Puerto Rico , Puerto Rico* - PUR
update combined_olympics_medals_01
set Country = 'Puerto Rico'
where Country_Code = 'PUR'


---------------------------------------------Russia , Russian Federation - RUS 
update combined_olympics_medals_01
set Country = 'Russia'
where Country_Code = 'RUS'


---------------------------------------------Syria , Syrian Arab Republic - SYR 
update combined_olympics_medals_01
set Country = 'Syria'
where Country_Code = 'SYR'

--------------------------------------------Chinese Taipei , Taiwan - TPE 
update combined_olympics_medals_01
set Country = 'Taiwan(Chinese Taipei)'
where Country_Code = 'TPE'


--------------------------------------------Great Britain , United Kingdom - GBR
update combined_olympics_medals_01
set Country = 'Great Britain'
where Country_Code = 'GBR'


select Country_Code , Country
from combined_olympics_medals_01
group by Country_Code , Country



select distinct Country 
from combined_olympics_medals_01


select distinct Country_Code 
from combined_olympics_medals_01

--------------Trinidad and Tobago -TRI , TTO 
-- TRI is not an official IOC code for Trinidad and Tobago; TTO is the correct and recognized code.
update combined_olympics_medals_01
set Country_Code = 'TTO'
where Country = 'Trinidad and Tobago'


----------------Netherlands - AHO , NED
--NED is the official and current IOC code for the Netherlands.
--AHO was used for the Netherlands Antilles, which no longer exists as a political entity, so it is no longer in use. Therefore, only NED is relevant for the Netherlands in the Olympics today.

update combined_olympics_medals_01
set Country_Code = 'NED'
where Country = 'Netherlands'


--------------- Singapore - SGP , SIN 
--SGP is the correct and current IOC country code for Singapore.
update combined_olympics_medals_01
set Country_Code = 'SGP'
where Country = 'Singapore'
--------------


--get country still had two codes 
SELECT Country, COUNT(DISTINCT Country_Code) AS Code_Count
FROM combined_olympics_medals_01
GROUP BY Country
HAVING COUNT(DISTINCT Country_Code) > 1;


select Country_Code , Country
from combined_olympics_medals_01
where Country = 'Serbia'


------Serbia - SRB , SCG 
--SRB is the current IOC country code for Serbia.
update combined_olympics_medals_01
set Country_Code = 'SRB'
where Country = 'Serbia'



--------------
select *
from combined_olympics_medals_01
where Event = '100m'
and Event_gender ='M'

select *
from combined_olympics_medals_01


-- use CTE for that - get duplicates
with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from combined_olympics_medals_01
)
select *
from get_duplicate
where row_num > 1

--delete  Duplicates create another table 

select *
into combined_olympics_medals_02
from combined_olympics_medals_01

with get_duplicate as(
select 
row_number() over (partition by  City , Year,Sport,Discipline,Event,Athlete, Country_Code,Country,Event_gender,Medal  order by (select NULL) ) as row_num, -- in this case row number based on all
*
from combined_olympics_medals_02
)
delete 
from get_duplicate
where row_num > 1



select *
from combined_olympics_medals_02
where Event = '100m'
and Event_gender ='M'


select *
from combined_olympics_medals_02
where Year = '2020'
and Event ='100m'
and Event_gender ='M'





























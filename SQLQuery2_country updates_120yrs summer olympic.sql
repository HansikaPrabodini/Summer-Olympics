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

----------in here want add another country column , for proper location purpose and country code 

select *
from otz_05

alter table otz_05
add Country varchar(255)

update otz_05
set Country = 'Finland'
where NOC = 'FIN'


------update countries 

UPDATE otz_05 SET Country = 'Afghanistan' WHERE NOC = 'AFG';
UPDATE otz_05 SET Country = 'Albania' WHERE NOC = 'ALB';
UPDATE otz_05 SET Country = 'Algeria' WHERE NOC = 'ALG';
UPDATE otz_05 SET Country = 'Andorra' WHERE NOC = 'AND';
UPDATE otz_05 SET Country = 'Angola' WHERE NOC = 'ANG';
UPDATE otz_05 SET Country = 'Argentina' WHERE NOC = 'ARG';
UPDATE otz_05 SET Country = 'Armenia' WHERE NOC = 'ARM';
UPDATE otz_05 SET Country = 'Australia' WHERE NOC = 'AUS';
UPDATE otz_05 SET Country = 'Austria' WHERE NOC = 'AUT';
UPDATE otz_05 SET Country = 'Azerbaijan' WHERE NOC = 'AZE';
UPDATE otz_05 SET Country = 'Bahamas' WHERE NOC = 'BAH';
UPDATE otz_05 SET Country = 'Bahrain' WHERE NOC = 'BRN';
UPDATE otz_05 SET Country = 'Bangladesh' WHERE NOC = 'BAN';
UPDATE otz_05 SET Country = 'Barbados' WHERE NOC = 'BAR';
UPDATE otz_05 SET Country = 'Belarus' WHERE NOC = 'BLR';
UPDATE otz_05 SET Country = 'Belgium' WHERE NOC = 'BEL';
UPDATE otz_05 SET Country = 'Belize' WHERE NOC = 'BIZ';
UPDATE otz_05 SET Country = 'Benin' WHERE NOC = 'BEN';
UPDATE otz_05 SET Country = 'Bhutan' WHERE NOC = 'BHU';
UPDATE otz_05 SET Country = 'Bolivia' WHERE NOC = 'BOL';
UPDATE otz_05 SET Country = 'Bosnia and Herzegovina' WHERE NOC = 'BIH';
UPDATE otz_05 SET Country = 'Botswana' WHERE NOC = 'BOT';
UPDATE otz_05 SET Country = 'Brazil' WHERE NOC = 'BRA';
UPDATE otz_05 SET Country = 'Brunei' WHERE NOC = 'BRU';
UPDATE otz_05 SET Country = 'Bulgaria' WHERE NOC = 'BUL';
UPDATE otz_05 SET Country = 'Burkina Faso' WHERE NOC = 'BUR';
UPDATE otz_05 SET Country = 'Burundi' WHERE NOC = 'BDI';
UPDATE otz_05 SET Country = 'Cambodia' WHERE NOC = 'CAM';
UPDATE otz_05 SET Country = 'Cameroon' WHERE NOC = 'CMR';
UPDATE otz_05 SET Country = 'Canada' WHERE NOC = 'CAN';
UPDATE otz_05 SET Country = 'Cape Verde' WHERE NOC = 'CPV';
UPDATE otz_05 SET Country = 'Central African Republic' WHERE NOC = 'CAF';
UPDATE otz_05 SET Country = 'Chad' WHERE NOC = 'CHA';
UPDATE otz_05 SET Country = 'Chile' WHERE NOC = 'CHI';
UPDATE otz_05 SET Country = 'China' WHERE NOC = 'CHN';
UPDATE otz_05 SET Country = 'Colombia' WHERE NOC = 'COL';
UPDATE otz_05 SET Country = 'Comoros' WHERE NOC = 'COM';
UPDATE otz_05 SET Country = 'Democratic Republic of the Congo' WHERE NOC = 'COD';
UPDATE otz_05 SET Country = 'Republic of the Congo' WHERE NOC = 'COG';
UPDATE otz_05 SET Country = 'Costa Rica' WHERE NOC = 'CRC';
UPDATE otz_05 SET Country = 'Côte d\''Ivoire' WHERE NOC = 'CIV';
UPDATE otz_05 SET Country = 'Croatia' WHERE NOC = 'CRO';
UPDATE otz_05 SET Country = 'Cuba' WHERE NOC = 'CUB';
UPDATE otz_05 SET Country = 'Cyprus' WHERE NOC = 'CYP';
UPDATE otz_05 SET Country = 'Czech Republic' WHERE NOC = 'CZE';
UPDATE otz_05 SET Country = 'Denmark' WHERE NOC = 'DEN';
UPDATE otz_05 SET Country = 'Djibouti' WHERE NOC = 'DJI';
UPDATE otz_05 SET Country = 'Dominican Republic' WHERE NOC = 'DOM';
UPDATE otz_05 SET Country = 'Ecuador' WHERE NOC = 'ECU';
UPDATE otz_05 SET Country = 'Egypt' WHERE NOC = 'EGY';
UPDATE otz_05 SET Country = 'El Salvador' WHERE NOC = 'ESA';
UPDATE otz_05 SET Country = 'Equatorial Guinea' WHERE NOC = 'GEQ';
UPDATE otz_05 SET Country = 'Eritrea' WHERE NOC = 'ERI';
UPDATE otz_05 SET Country = 'Estonia' WHERE NOC = 'EST';
UPDATE otz_05 SET Country = 'Ethiopia' WHERE NOC = 'ETH';
UPDATE otz_05 SET Country = 'Fiji' WHERE NOC = 'FIJ';
UPDATE otz_05 SET Country = 'Finland' WHERE NOC = 'FIN';
UPDATE otz_05 SET Country = 'France' WHERE NOC = 'FRA';
UPDATE otz_05 SET Country = 'Gabon' WHERE NOC = 'GAB';
UPDATE otz_05 SET Country = 'Gambia' WHERE NOC = 'GAM';
UPDATE otz_05 SET Country = 'Georgia' WHERE NOC = 'GEO';
UPDATE otz_05 SET Country = 'Germany' WHERE NOC = 'GER';
UPDATE otz_05 SET Country = 'Ghana' WHERE NOC = 'GHA';
UPDATE otz_05 SET Country = 'Greece' WHERE NOC = 'GRE';
UPDATE otz_05 SET Country = 'Grenada' WHERE NOC = 'GRN';
UPDATE otz_05 SET Country = 'Guam' WHERE NOC = 'GUM';
UPDATE otz_05 SET Country = 'Guatemala' WHERE NOC = 'GUA';
UPDATE otz_05 SET Country = 'Guinea' WHERE NOC = 'GUI';
UPDATE otz_05 SET Country = 'Guinea-Bissau' WHERE NOC = 'GNB';
UPDATE otz_05 SET Country = 'Guyana' WHERE NOC = 'GUY';
UPDATE otz_05 SET Country = 'Haiti' WHERE NOC = 'HAI';
UPDATE otz_05 SET Country = 'Honduras' WHERE NOC = 'HON';
UPDATE otz_05 SET Country = 'Hong Kong' WHERE NOC = 'HKG';
UPDATE otz_05 SET Country = 'Hungary' WHERE NOC = 'HUN';
UPDATE otz_05 SET Country = 'Iceland' WHERE NOC = 'ISL';
UPDATE otz_05 SET Country = 'India' WHERE NOC = 'IND';
UPDATE otz_05 SET Country = 'Indonesia' WHERE NOC = 'INA';
UPDATE otz_05 SET Country = 'Iran' WHERE NOC = 'IRI';
UPDATE otz_05 SET Country = 'Iraq' WHERE NOC = 'IRQ';
UPDATE otz_05 SET Country = 'Ireland' WHERE NOC = 'IRL';
UPDATE otz_05 SET Country = 'Israel' WHERE NOC = 'ISR';
UPDATE otz_05 SET Country = 'Italy' WHERE NOC = 'ITA';
UPDATE otz_05 SET Country = 'Jamaica' WHERE NOC = 'JAM';
UPDATE otz_05 SET Country = 'Japan' WHERE NOC = 'JPN';
UPDATE otz_05 SET Country = 'Jordan' WHERE NOC = 'JOR';
UPDATE otz_05 SET Country = 'Kazakhstan' WHERE NOC = 'KAZ';
UPDATE otz_05 SET Country = 'Kenya' WHERE NOC = 'KEN';
UPDATE otz_05 SET Country = 'Kiribati' WHERE NOC = 'KIR';
UPDATE otz_05 SET Country = 'South Korea' WHERE NOC = 'KOR';
UPDATE otz_05 SET Country = 'Kosovo' WHERE NOC = 'KOS';
UPDATE otz_05 SET Country = 'Kuwait' WHERE NOC = 'KUW';
UPDATE otz_05 SET Country = 'Kyrgyzstan' WHERE NOC = 'KGZ';
UPDATE otz_05 SET Country = 'Laos' WHERE NOC = 'LAO';
UPDATE otz_05 SET Country = 'Latvia' WHERE NOC = 'LAT';
UPDATE otz_05 SET Country = 'Lebanon' WHERE NOC = 'LBN';
UPDATE otz_05 SET Country = 'Lesotho' WHERE NOC = 'LES';
UPDATE otz_05 SET Country = 'Liberia' WHERE NOC = 'LBR';
UPDATE otz_05 SET Country = 'Libya' WHERE NOC = 'LBA';
UPDATE otz_05 SET Country = 'Liechtenstein' WHERE NOC = 'LIE';
UPDATE otz_05 SET Country = 'Lithuania' WHERE NOC = 'LTU';
UPDATE otz_05 SET Country = 'Luxembourg' WHERE NOC = 'LUX';
UPDATE otz_05 SET Country = 'Madagascar' WHERE NOC = 'MAD';
UPDATE otz_05 SET Country = 'Malawi' WHERE NOC = 'MAW';
UPDATE otz_05 SET Country = 'Malaysia' WHERE NOC = 'MAS';
UPDATE otz_05 SET Country = 'Maldives' WHERE NOC = 'MDV';
UPDATE otz_05 SET Country = 'Mali' WHERE NOC = 'MLI';
UPDATE otz_05 SET Country = 'Malta' WHERE NOC = 'MLT';
UPDATE otz_05 SET Country = 'Mauritania' WHERE NOC = 'MTN';
UPDATE otz_05 SET Country = 'Mauritius' WHERE NOC = 'MRI';
UPDATE otz_05 SET Country = 'Mexico' WHERE NOC = 'MEX';
UPDATE otz_05 SET Country = 'Moldova' WHERE NOC = 'MDA';
UPDATE otz_05 SET Country = 'Monaco' WHERE NOC = 'MON';
UPDATE otz_05 SET Country = 'Mongolia' WHERE NOC = 'MGL';
UPDATE otz_05 SET Country = 'Montenegro' WHERE NOC = 'MNE';
UPDATE otz_05 SET Country = 'Morocco' WHERE NOC = 'MAR';
UPDATE otz_05 SET Country = 'Mozambique' WHERE NOC = 'MOZ';
UPDATE otz_05 SET Country = 'Myanmar' WHERE NOC = 'MYA';
UPDATE otz_05 SET Country = 'Namibia' WHERE NOC = 'NAM';
UPDATE otz_05 SET Country = 'Nauru' WHERE NOC = 'NRU';
UPDATE otz_05 SET Country = 'Nepal' WHERE NOC = 'NEP';
UPDATE otz_05 SET Country = 'Netherlands' WHERE NOC = 'NED';
UPDATE otz_05 SET Country = 'New Zealand' WHERE NOC = 'NZL';
UPDATE otz_05 SET Country = 'Nicaragua' WHERE NOC = 'NCA';
UPDATE otz_05 SET Country = 'Niger' WHERE NOC = 'NIG';
UPDATE otz_05 SET Country = 'Nigeria' WHERE NOC = 'NGR';
UPDATE otz_05 SET Country = 'North Korea' WHERE NOC = 'PRK';
UPDATE otz_05 SET Country = 'North Macedonia' WHERE NOC = 'MKD';
UPDATE otz_05 SET Country = 'Norway' WHERE NOC = 'NOR';
UPDATE otz_05 SET Country = 'Oman' WHERE NOC = 'OMA';
UPDATE otz_05 SET Country = 'Pakistan' WHERE NOC = 'PAK';
UPDATE otz_05 SET Country = 'Palau' WHERE NOC = 'PLW';
UPDATE otz_05 SET Country = 'Palestine' WHERE NOC = 'PLE';
UPDATE otz_05 SET Country = 'Panama' WHERE NOC = 'PAN';
UPDATE otz_05 SET Country = 'Papua New Guinea' WHERE NOC = 'PNG';
UPDATE otz_05 SET Country = 'Paraguay' WHERE NOC = 'PAR';
UPDATE otz_05 SET Country = 'Peru' WHERE NOC = 'PER';
UPDATE otz_05 SET Country = 'Philippines' WHERE NOC = 'PHI';
UPDATE otz_05 SET Country = 'Poland' WHERE NOC = 'POL';
UPDATE otz_05 SET Country = 'Portugal' WHERE NOC = 'POR';
UPDATE otz_05 SET Country = 'Puerto Rico' WHERE NOC = 'PUR';
UPDATE otz_05 SET Country = 'Qatar' WHERE NOC = 'QAT';
UPDATE otz_05 SET Country = 'Romania' WHERE NOC = 'ROU';
UPDATE otz_05 SET Country = 'Russia' WHERE NOC = 'RUS';
UPDATE otz_05 SET Country = 'Rwanda' WHERE NOC = 'RWA';
UPDATE otz_05 SET Country = 'Saint Kitts and Nevis' WHERE NOC = 'SKN';
UPDATE otz_05 SET Country = 'Saint Lucia' WHERE NOC = 'LCA';
UPDATE otz_05 SET Country = 'Saint Vincent and the Grenadines' WHERE NOC = 'VIN';
UPDATE otz_05 SET Country = 'Samoa' WHERE NOC = 'SAM';
UPDATE otz_05 SET Country = 'San Marino' WHERE NOC = 'SMR';
UPDATE otz_05 SET Country = 'Sao Tome and Principe' WHERE NOC = 'STP';
UPDATE otz_05 SET Country = 'Saudi Arabia' WHERE NOC = 'KSA';
UPDATE otz_05 SET Country = 'Senegal' WHERE NOC = 'SEN';
UPDATE otz_05 SET Country = 'Serbia' WHERE NOC = 'SRB';
UPDATE otz_05 SET Country = 'Seychelles' WHERE NOC = 'SEY';
UPDATE otz_05 SET Country = 'Sierra Leone' WHERE NOC = 'SLE';
UPDATE otz_05 SET Country = 'Singapore' WHERE NOC = 'SGP';
UPDATE otz_05 SET Country = 'Slovakia' WHERE NOC = 'SVK';
UPDATE otz_05 SET Country = 'Slovenia' WHERE NOC = 'SLO';
UPDATE otz_05 SET Country = 'Solomon Islands' WHERE NOC = 'SOL';
UPDATE otz_05 SET Country = 'Somalia' WHERE NOC = 'SOM';
UPDATE otz_05 SET Country = 'South Africa' WHERE NOC = 'RSA';
UPDATE otz_05 SET Country = 'South Sudan' WHERE NOC = 'SSD';
UPDATE otz_05 SET Country = 'Spain' WHERE NOC = 'ESP';
UPDATE otz_05 SET Country = 'Sri Lanka' WHERE NOC = 'SRI';
UPDATE otz_05 SET Country = 'Sudan' WHERE NOC = 'SUD';
UPDATE otz_05 SET Country = 'Suriname' WHERE NOC = 'SUR';
UPDATE otz_05 SET Country = 'Eswatini' WHERE NOC = 'SWZ';
UPDATE otz_05 SET Country = 'Sweden' WHERE NOC = 'SWE';
UPDATE otz_05 SET Country = 'Switzerland' WHERE NOC = 'SUI';
UPDATE otz_05 SET Country = 'Syria' WHERE NOC = 'SYR';
UPDATE otz_05 SET Country = 'Taiwan' WHERE NOC = 'TPE';
UPDATE otz_05 SET Country = 'Tajikistan' WHERE NOC = 'TJK';
UPDATE otz_05 SET Country = 'Tanzania' WHERE NOC = 'TAN';
UPDATE otz_05 SET Country = 'Thailand' WHERE NOC = 'THA';
UPDATE otz_05 SET Country = 'Timor-Leste' WHERE NOC = 'TLS';
UPDATE otz_05 SET Country = 'Togo' WHERE NOC = 'TOG';
UPDATE otz_05 SET Country = 'Tonga' WHERE NOC = 'TGA';
UPDATE otz_05 SET Country = 'Trinidad and Tobago' WHERE NOC = 'TTO';
UPDATE otz_05 SET Country = 'Tunisia' WHERE NOC = 'TUN';
UPDATE otz_05 SET Country = 'Turkey' WHERE NOC = 'TUR';
UPDATE otz_05 SET Country = 'Turkmenistan' WHERE NOC = 'TKM';
UPDATE otz_05 SET Country = 'Tuvalu' WHERE NOC = 'TUV';
UPDATE otz_05 SET Country = 'Uganda' WHERE NOC = 'UGA';
UPDATE otz_05 SET Country = 'Ukraine' WHERE NOC = 'UKR';
UPDATE otz_05 SET Country = 'United Arab Emirates' WHERE NOC = 'UAE';
UPDATE otz_05 SET Country = 'United Kingdom' WHERE NOC = 'GBR';
UPDATE otz_05 SET Country = 'United States' WHERE NOC = 'USA';
UPDATE otz_05 SET Country = 'Uruguay' WHERE NOC = 'URU';
UPDATE otz_05 SET Country = 'Uzbekistan' WHERE NOC = 'UZB';
UPDATE otz_05 SET Country = 'Vanuatu' WHERE NOC = 'VAN';
UPDATE otz_05 SET Country = 'Venezuela' WHERE NOC = 'VEN';
UPDATE otz_05 SET Country = 'Vietnam' WHERE NOC = 'VIE';
UPDATE otz_05 SET Country = 'Yemen' WHERE NOC = 'YEM';
UPDATE otz_05 SET Country = 'Zambia' WHERE NOC = 'ZAM';
UPDATE otz_05 SET Country = 'Zimbabwe' WHERE NOC = 'ZIM';



select *
from otz_05
where Country is null


select distinct Team , NOC
from otz_05
where Country is null



---add country code column 



select *
into otz_06
from otz_05



select *
from otz_06


alter table otz_06
add Country_Code varchar(255)


update otz_06
set Country_Code = NOC


UPDATE otz_06 SET Country_Code = 'BER' WHERE Team = 'Bermuda';
UPDATE otz_06 SET Country_Code = 'BOH' WHERE Team = 'Bohemia';
UPDATE otz_06 SET Country_Code = 'TCH' WHERE Team = 'Czechoslovakia';
UPDATE otz_06 SET Country_Code = 'TCH' WHERE Team = 'Czechoslovakia-1';
UPDATE otz_06 SET Country_Code = 'GDR' WHERE Team = 'East Germany';
UPDATE otz_06 SET Country_Code = 'GDR' WHERE Team = 'East Germany-1';
UPDATE otz_06 SET Country_Code = 'GBR' WHERE Team = 'Great Britain';
UPDATE otz_06 SET Country_Code = 'IOA' WHERE Team = 'Individual Olympic Athletes';
UPDATE otz_06 SET Country_Code = 'LIB' WHERE Team = 'Lebanon';
UPDATE otz_06 SET Country_Code = 'AHO' WHERE Team = 'Netherlands Antilles';
UPDATE otz_06 SET Country_Code = 'SCG' WHERE Team = 'Serbia and Montenegro';
UPDATE otz_06 SET Country_Code = 'URS' WHERE Team = 'Soviet Union';
UPDATE otz_06 SET Country_Code = 'TOS' WHERE Team = 'Tornado';  -- Verify this Country_Code
UPDATE otz_06 SET Country_Code = 'EUN' WHERE Team = 'Unified Team';
UPDATE otz_06 SET Country_Code = 'USA' WHERE Team = 'United States';
UPDATE otz_06 SET Country_Code = 'FRG' WHERE Team = 'West Germany';
UPDATE otz_06 SET Country_Code = 'FRG' WHERE Team = 'West Germany-1';
UPDATE otz_06 SET Country_Code = 'WIF' WHERE Team = 'West Indies Federation';
UPDATE otz_06 SET Country_Code = 'YUG' WHERE Team = 'Yugoslavia';





select distinct Country_Code
from otz_06
where Country is null


---update 
UPDATE otz_06 SET Country = 'Netherlands Antilles' WHERE Country_Code = 'AHO';
UPDATE otz_06 SET Country = 'Great Britain' WHERE Country_Code = 'GBR';
UPDATE otz_06 SET Country = 'Australia and New Zealand' WHERE Country_Code = 'ANZ';  -- Historical NOC
UPDATE otz_06 SET Country = 'West Germany' WHERE Country_Code = 'FRG';
UPDATE otz_06 SET Country = 'West Indies Federation' WHERE Country_Code = 'WIF';
UPDATE otz_06 SET Country = 'Individual Olympic Athletes' WHERE Country_Code = 'IOA';
UPDATE otz_06 SET Country = 'Bermuda' WHERE Country_Code = 'BER';
UPDATE otz_06 SET Country = 'Serbia and Montenegro' WHERE Country_Code = 'SCG';
UPDATE otz_06 SET Country = 'Soviet Union' WHERE Country_Code = 'URS';
UPDATE otz_06 SET Country = 'East Germany' WHERE Country_Code = 'GDR';
UPDATE otz_06 SET Country = 'Lebanon' WHERE Country_Code = 'LIB';
UPDATE otz_06 SET Country = 'Unified Team' WHERE Country_Code = 'EUN';
UPDATE otz_06 SET Country = 'Czechoslovakia' WHERE Country_Code = 'TCH';
UPDATE otz_06 SET Country = 'Tornado' WHERE Country_Code = 'TOS';  -- Verify this entry
UPDATE otz_06 SET Country = 'Bohemia' WHERE Country_Code = 'BOH';
UPDATE otz_06 SET Country = 'Yugoslavia' WHERE Country_Code = 'YUG';


select *
from otz_06



----- add event gender 
alter table otz_06
add Event_gender varchar(255)



---get copy of table 
select *
into otz_07
from otz_06

select *
from otz_07
where Sex ='M'


update otz_07
set Event_gender ='W'
where Event like '%Women''s%'


update otz_07
set Event_gender ='M'
where Event like '%Men''s%'
and Event_gender is null 



update otz_07
set Event_gender ='X'
where Event like '%Mixed%'
and Event_gender is null 


select *
from otz_07
where Event_gender is null


---- 
select Country_Code , 
sum(case when Medal ='Gold' then 1 else 0 end ) as Gold_medals,
sum(case when Medal ='Silver' then 1 else 0 end ) as Silver_medals,
sum(case when Medal ='Bronze' then 1 else 0 end ) as Bronze_medals,
count(*) as Total_medals
from otz_07
where Year ='2016'
group by Country_Code
order by 2 desc


--need to drop ID , Name , Sex , Age , Height , Weight , Team , NOC , Games , Season 

select *
into otz_08
from otz_07

select *
from otz_08


alter table otz_08
drop column ID , Name , Sex ,Age , Height , Weight , Team , Noc , Games , Season 




----- add host country 
select distinct City 
from otz_08


-- add column Host_Country 
alter table otz_08
add Host_Country varchar(255)


UPDATE otz_08 SET Host_Country = 'Finland' WHERE City = 'Helsinki';
UPDATE otz_08 SET Host_Country = 'Sweden' WHERE City = 'Stockholm';
UPDATE otz_08 SET Host_Country = 'Brazil' WHERE City = 'Rio de Janeiro';
UPDATE otz_08 SET Host_Country = 'United States' WHERE City = 'Los Angeles';
UPDATE otz_08 SET Host_Country = 'France' WHERE City = 'Paris';
UPDATE otz_08 SET Host_Country = 'Canada' WHERE City = 'Montreal';
UPDATE otz_08 SET Host_Country = 'United States' WHERE City = 'Atlanta';
UPDATE otz_08 SET Host_Country = 'United Kingdom' WHERE City = 'London';
UPDATE otz_08 SET Host_Country = 'Netherlands' WHERE City = 'Amsterdam';
UPDATE otz_08 SET Host_Country = 'China' WHERE City = 'Beijing';
UPDATE otz_08 SET Host_Country = 'Japan' WHERE City = 'Tokyo';
UPDATE otz_08 SET Host_Country = 'United States' WHERE City = 'St. Louis';
UPDATE otz_08 SET Host_Country = 'Australia' WHERE City = 'Sydney';
UPDATE otz_08 SET Host_Country = 'Germany' WHERE City = 'Munich';
UPDATE otz_08 SET Host_Country = 'Russia' WHERE City = 'Moskva';
UPDATE otz_08 SET Host_Country = 'Italy' WHERE City = 'Roma';
UPDATE otz_08 SET Host_Country = 'Spain' WHERE City = 'Barcelona';
UPDATE otz_08 SET Host_Country = 'Belgium' WHERE City = 'Antwerpen';
UPDATE otz_08 SET Host_Country = 'Mexico' WHERE City = 'Mexico City';
UPDATE otz_08 SET Host_Country = 'Germany' WHERE City = 'Berlin';
UPDATE otz_08 SET Host_Country = 'South Korea' WHERE City = 'Seoul';
UPDATE otz_08 SET Host_Country = 'Greece' WHERE City = 'Athina';
UPDATE otz_08 SET Host_Country = 'Australia' WHERE City = 'Melbourne';




select *
from otz_08
where Country_Code ='GBR'


Update otz_08
set Country ='United Kingdom'
where Country_Code ='GBR'


---want check one country code has two or more countries 

SELECT Country_Code, COUNT(DISTINCT Country) AS Country_Count
FROM otz_08
GROUP BY Country_Code
HAVING COUNT(DISTINCT Country) > 1;



SELECT Country_Code, Country
FROM otz_08
WHERE Country_Code IN (
    SELECT Country_Code
    FROM otz_06
    GROUP BY Country_Code
    HAVING COUNT(DISTINCT Country) > 1
)
ORDER BY Country_Code, Country;



select *
from otz_08
where Country_Code ='USA'


---update it 

Update otz_08
set Country ='United States'
where Country_Code ='USA'
and Country is null


---- update France 

select *
from otz_08
where Country ='France'


Update otz_08
set Country_Code ='FRA'
where  Country ='France'


---- update France 

select *
from otz_08
where Country ='United Arab Emirates'


Update otz_08
set Country_Code ='UAE'
where  Country ='United Arab Emirates'


---- update United Kingdom 

select *
from otz_08
where Country ='United Kingdom'


Update otz_08
set Country_Code ='GBR'
where  Country ='United Kingdom'



--- want add Soviet Union as russia 
select *
into otz_09
from otz_08


update otz_09
set Country ='Russia'
where Country ='Soviet Union'



-- IN HERE add Soviet Union as russia 


select *
from otz_09	
where Country='South Korea'


-------------- check for host years 
update otz_09
Set Host_Country ='Australia'
where Year ='1956'







select *
from [dbo].[tokyo_1$]

select *
into tokyo_1
from [dbo].[tokyo_1$]


---combine tokyo for this 

-- Step 1: Create a new table with the desired structure
-- Create a new table and insert combined data from two existing tables
SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
INTO otz_11
FROM (
    SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
    FROM otz_09
    UNION
    SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
    FROM tokyo_1
) AS CombinedData;



select *
from otz_11









SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
INTO otz_12
FROM (
    SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
    FROM otz_09
    UNION ALL
    SELECT Year, City, Sport, Event, Medal, Country, Country_Code, Event_gender, Host_Country
    FROM tokyo_1
) AS CombinedData;


select *
from otz_12
where Country like '%Djibouti%'

select distinct Country
from otz_12


select *
from otz_12
where Country_Code ='DJI'



update otz_12
set Country = 'Côte d\''Ivoire'
where Country_Code ='CIV'



update otz_12
set Country = 'Iran'
where Country_Code ='IRI'


select *
from otz_12
where Year ='1956'


select Host_Country , Year
from otz_12
group by Host_Country , Year













------
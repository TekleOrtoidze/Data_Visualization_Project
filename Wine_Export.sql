-- create database data_visualization_project 
CREATE DATABASE IF NOT EXISTS data_visualization_project; 

-- create table export_2021
-- import data with import wizard 
DROP TABLE IF EXISTS export_2021;
CREATE TABLE IF NOT EXISTS export_2021
( 
 country varchar (25) not null, 
 variety varchar (100), 
 sort varchar (50), 
 quantity int not null, 
 size decimal (5,3) not null
); 
 
-- create table export_2020
-- import data with import wizard 
DROP TABLE IF EXISTS export_2020;
CREATE TABLE IF NOT EXISTS export_2020
( 
 country varchar (25) not null, 
 variety varchar (100), 
 sort varchar (50), 
 quantity int not null, 
 size decimal (5,3) not null
); 

-- create table export_2019
-- import data with import wizard 
DROP TABLE IF EXISTS export_2019;
CREATE TABLE IF NOT EXISTS export_2019
( 
 country varchar (25) not null, 
 variety varchar (100), 
 sort varchar (50), 
 quantity int not null, 
 size decimal (5,3) not null
); 

-- create table export_2014_to_2021
-- import data with import wizard 
DROP TABLE IF EXISTS export_2014_to_2021;
CREATE TABLE IF NOT EXISTS export_2014_to_2021
( 
 country varchar (25) not null, 
 date text, 
 quantity int
);

-- add a row in export_2014_to_2021
INSERT INTO export_2014_to_2021
VALUES ('Japan', 
		'12/12/2019', 
        202094); 
        
-- total sum of exported wine from 2014 to 2021 
-- total sum of countries that imported wine from 2014 to 2021
SELECT sum(quantity), 
       sum(DISTINCT country)
from export_2014_to_2021;

-- top 10 countries with the highest number of importing Georgian wine 
select country,
      sum(quantity) as total_quantity
from export_2014_to_2021
group by country 
order by quantity desc; 

-- how many percent of exported wine goes to Russia? 
SELECT sum(quantity) as total_exported_wine,
	truncate
    (
	(select sum(quantity) 
	 from export_2014_to_2021 
	 where country = 'Russia') * 100 / sum(quantity), 2) 
     as russian_part_perc
from export_2014_to_2021;

-- top 10 most exported wine variety 
SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety;

-- filter top 10 wine varieties by sort 
SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort
having variety like '%alazan%'; 

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort with rollup 
having variety like '%pirosman%' and sort REGEXP 'semi-dry rose|semi-dry red';

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort
having variety like '%tsinanda%'; 

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort
having variety like '%homemade%' and sort regexp 'dry red|dry white'; 

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort
having variety like '%homemade%' and sort regexp 'sweet red|sweet white';

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort 
having variety like '%sparkling%' and sort regexp 'sweet red|sweet white';

SELECT *,
      sum(quantity)
FROM export_2021
GROUP BY variety, sort 
having variety regexp 'akhashen|khvanchk'




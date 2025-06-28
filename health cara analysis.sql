create database health;
use healthcare;

-- TOTAL OUTPATIENTS
SELECT COUNT(*) AS total_outpatients
FROM visits
WHERE `Service Type` = 'Outpatient'; 

select count(*) from visits where `Service Type` = 'Inpatient';  

select count(*) from visits where `Service Type` = 'Emergency';

-- SUM OF INPATINETS AND OUTPATIENTS PER MONTH

-- --> GET MONTH FROM YEAR
describe visits; -- Date of Visit column ka format TEXT h, convert it to date.
-- FOR THIS, CREATE A NEW COLUMN HAVING 'DATE' DATA TYPE AND ADD DATA OF
-- `DATE OF VISIT` TO THAT COLUMN BY CONVERTING ITS DATA TO DATE FORMAT USING 
-- STR-TO-DATE, AND THEN DROP THE PREVIOUS COLUMN.

alter table visits add column `date_of_visit` date; 
update visits set 
date_of_visit = str_to_date(`DATE OF VISIT`, '%m/%d/%Y');  -- yhan capital Y
-- is liye likha q k data m is ciolumn m date four digit year thi, agr 2 digit
-- year hoti to small y hi likhty
alter table visits drop column `DATE OF VISIT`;
SELECT date_of_visit FROM visits;

 
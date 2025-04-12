USE cs;
SELECT * FROM kh_sql;
-- 1 Gender distribution
SELECT 
    COUNT(CASE WHEN Gender = 'M' THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_count,
    COUNT(CASE WHEN gender = 'Other' THEN 1 END) AS Other
FROM kh_sql
WHERE COUNTRY = "India";

 -- 2 % respondents interested in higher education and sponsorship
SELECT 
    (COUNT(IF(`Higher Education Aspirations` = 'Yes', 1, NULL)) / COUNT(*)) * 100 AS Interested_percentage,
    (COUNT(IF(`Higher Education Aspirations` = 'If Sponsor', 1, NULL)) / COUNT(*)) * 100 AS Sponsorship_percentage
FROM kh_sql;
 
-- 3 6 TOP influences
SELECT `Influencing Factors`, COUNT(`Influencing Factors`) AS effect_influencing_factors
FROM kh_sql
GROUP BY `Influencing Factors`
ORDER BY effect_influencing_factors DESC
LIMIT 6; 

-- 4 Career influencing factors vary by gender
SELECT Gender, `Influencing Factors`, COUNT(`Influencing Factors`) AS effect_influencing_factors
FROM kh_sql
GROUP BY Gender,`Influencing Factors`
ORDER BY effect_influencing_factors DESC;

-- 5 % of respondents willing to work in same company for 3 years
SELECT 
    (COUNT(IF(`3 or more Years Work Tenure` = 'Yes', 1, NULL)) / COUNT(*)) * 100 AS Yes_percentage_3years,
    (COUNT(IF(`3 or more Years Work Tenure` = 'Depends on Company Culture', 1, NULL)) / COUNT(*)) * 100 AS Companyculture_percentage_3years
FROM kh_sql;

-- 6 respondents prefer to work for socially impactful companies
SELECT 
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 8 AND 10 THEN 1 END ) AS will_work,
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 4 AND 7 THEN 1 END ) AS neutral,
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 1 AND 3 THEN 1 END ) AS wiil_notwork
FROM kh_sql;
-- 7 preference for socially impactful companies vary by gender
SELECT Gender,
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 8 AND 10 THEN 1 END ) AS will_work,
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 4 AND 7 THEN 1 END ) AS neutral,
COUNT(CASE WHEN `Company not have Social Impact` BETWEEN 1 AND 3 THEN 1 END ) AS wiil_notwork
FROM kh_sql
GROUP BY Gender;
-- 8  distribution of minimum expected salary in the first 3 years
SELECT `Min Exp Salary for 3 years`, COUNT(*)
FROM kh_sql
GROUP BY `Min Exp Salary for 3 years`; 
-- 9 EXPECTED min salry in hand
SELECT `Starting Min Exp Salary`, COUNT(*) AS min_salary
FROM kh_sql
GROUP BY `Starting Min Exp Salary`
ORDER BY min_salary 
LIMIT 1; 
-- 10 % of respondents prefer remote working
SELECT 
(COUNT(IF(`Preferred Working Mode` = 'Fully Remote', 1, NULL)) / COUNT(*)) * 100 Remoteworking_percentage
FROM kh_sql; 
-- 11  preferred number of daily work hours
SELECT `Work Hours`, COUNT(*) AS Preferred_workinghours
FROM kh_sql
GROUP BY `Work Hours`
ORDER BY Preferred_workinghours DESC
LIMIT 1; 
-- 12 common work frustrations among respondents
SELECT `Frustration factors at work`, COUNT(*) AS effect_work_frustartions
FROM kh_sql
GROUP BY `Frustration factors at work`
ORDER BY effect_work_frustartions DESC; 
-- 13 need for work-life balance interventions vary by gender
SELECT Gender, `Full week break`, Count(*) AS need_forbreak
FROM kh_sql
GROUP BY Gender, `Full week break`; 
-- 14 abusive manager
SELECT (COUNT(IF(`Abusive Manager` = 'Yes', 1, NULL))) AS wiling_towork
FROM kh_sql;
-- 15  distribution of minimum expected salary after 5 years
SELECT `Min Exp Salary for 5 years`, COUNT(*)
FROM kh_sql
GROUP BY `Min Exp Salary for 5 years`;  
-- 16  remote working preferences by gender?
SELECT Gender,
(COUNT(IF(`Preferred Working Mode` = 'Fully Remote', 1, NULL))) Remoteworking_bygender
FROM kh_sql
GROUP BY Gender; 
-- 17 top work frustrations for each gender
SELECT Gender, `Frustration factors at work`, COUNT(*) AS effect_work_frustartions
FROM kh_sql
GROUP BY Gender, `Frustration factors at work`
ORDER BY effect_work_frustartions DESC;  
-- 18 factors boost work happiness and productivity for respondents
SELECT `Be happier and productive at work`, COUNT(*) AS effect_of_factors
FROM kh_sql
GROUP BY `Be happier and productive at work`
ORDER BY effect_of_factors DESC; 
-- 19 % of respondents need sponsorship for education abroad
SELECT 
 (COUNT(IF(`Higher Education Aspirations` = 'If Sponsor', 1, NULL)) / COUNT(*)) * 100 AS Sponsorship_percentage
 FROM kh_sql; 









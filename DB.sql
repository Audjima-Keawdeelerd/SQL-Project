--อยากเห็นข้อมูลทั้งหมด
select *
from ds_salaries;

--เปลี่ยนชื่อคลอลัมภ์แรก
EXEC sp_rename 
'dbo.ds_salaries.field1', 
'employee_id', 
'COLUMN';

--clean the data
select * from ds_salaries
where employee_id is NULL;

select count(*) as number_of_rows
from ds_salaries; 

 --ตำแหน่งงานที่ได้รับความนิยมสูงที่สุด
 select top(5)job_title, count(job_title) as total_count
 from ds_salaries
 group by job_title
 order by total_count DESC;

  --experience_level ในแต่ละระดับมีกี่คน
 select experience_level, count(experience_level) as total_experience_level
 from ds_salaries
 group by experience_level
 order by total_experience_level DESC;

  --ถ้าประสบการณ์มากขึ้น เงินจะเพิ่มขึ้นมั้ย 
 select experience_level, round(avg(salary_in_usd),2) as avg_salary_in_usd
 from ds_salaries
 group by experience_level;
 
  --ถ้าประสบการณ์มากขึ้น เงินจะเพิ่มขึ้นมั้ย 
 select experience_level, round(avg(salary_in_usd),2) as avg_salary_in_usd
 from ds_salaries
 group by experience_level;

--ตำแหน่งงานที่ได้เงินเดือนสูงกว่าค่าเฉลี่ยทั้งบริษัท
SELECT DISTINCT job_title
FROM ds_salaries
WHERE salary_in_usd >
      (SELECT AVG(salary_in_usd) FROM ds_salaries);

--พนักงานที่ได้เงินเดือนสูงที่สุด
SELECT *
FROM ds_salaries
WHERE salary_in_usd =
      (SELECT MAX(salary_in_usd) FROM ds_salaries);

--ประเทศที่มีเงินเดือนเฉลี่ยมากกว่า US
SELECT company_location,
       ROUND(AVG(salary_in_usd), 2) AS avg_salary
FROM ds_salaries
GROUP BY company_location
HAVING AVG(salary_in_usd) >
       (
         SELECT AVG(salary_in_usd)
         FROM ds_salaries
         WHERE company_location = 'US'
       );

--พนักงานที่ทำงานในประเทศที่ avg salary > 150,000
SELECT *
FROM ds_salaries
WHERE company_location IN
      (
        SELECT company_location
        FROM ds_salaries
        GROUP BY company_location
        HAVING AVG(salary_in_usd) > 150000
      );











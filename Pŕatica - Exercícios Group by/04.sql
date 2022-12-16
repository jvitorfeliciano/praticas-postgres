SELECT MAX(jobs.salary)  AS "maximumSalary", roles.name AS role  
FROM jobs 
JOIN roles
ON roles.id = jobs."roleId"
WHERE jobs.active=true
GROUP BY roles.name
ORDER BY "maximumSalary" ASC
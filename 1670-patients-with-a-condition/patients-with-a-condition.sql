# Write your MySQL query statement below
SELECT p.patient_id , p.patient_name, p.conditions
FROM Patients p
WHERE p.conditions LIKE '%DIAB1%' 
    AND SUBSTR(p.conditions,LOCATE('DIAB1',p.conditions)-1,1) =' '
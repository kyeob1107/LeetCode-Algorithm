# Write your MySQL query statement below
Select round(sum(tiv_2016), 2) As tiv_2016 From Insurance 
Where tiv_2015 In(
    Select tiv_2015 From Insurance
    Group By tiv_2015
    Having Count(*)>1
)
And (lat, lon) In(
    Select lat, lon From Insurance
    Group By lat, lon
    Having Count(*) = 1
)
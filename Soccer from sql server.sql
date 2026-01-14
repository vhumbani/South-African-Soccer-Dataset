
  --------------------------------------------
  ---1. View the first 100 rows of the dataset to understand its structure.
  SELECT TOP (100)*
  FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];
  -------------------------------------------
 ----2. Count the total number of players in the dataset
 Select count(player_name)
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];
 -------------------------------------------
 ----------3. List all unique teams in the league. 
 Select distinct team
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];
 -------------------------------------------
 ----4. Count how many players are in each team. 
 Select Team,
 count(player_name)As Number_of_Players
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
 Group by team;
 ----------------------------------
 --5. Identify the top 10 players with the most goals.
 Select top 10 Player_Name,
 sum(goals) as Total_Goals
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
 group by Player_Name
 order by Total_Goals desc;

 ---------------------------------------------
 --6. Find the average salary for players in each team. 
 Select Player_Name,
 Team,
 Average_Salary_Zar
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];
 -------------------------------------------------
 --7. Retrieve the top 10 players with the highest market val
 Select top 10 Player_Name,
 sum(Market_value_zar) as Market_value
 FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
 group by Player_name
 order by Market_value desc;
 ------------------------------------------------------
--8. Calculate the average passing accuracy for each position. 
Select Position,
Avg(passing_accuracy)As AVG_Passing_Accuracy
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by Position;
------------------------------------------
--9. Compare shot accuracy with goals to find correlations. 
Select shot_accuracy,
goals
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];
---------------------------------------
---10. Compute total goals and assists for each team.
Select distinct Team,
sum(goals) As Total_Goals
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by Team;
---------------------------------------
---11. Count players by their marital status.
Select Marital_status,
count(MARITAL_STATUS)As Marital_status
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by Marital_status;

------------------------------------------------------------
--12. Count players by nationality. 
Select nationality,
count(nationality) AS Nationality
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY Nationality;

----------------------------------------------------------------------
----13. Find average market value grouped by nationality. 
Select Nationality,
avg(market_value_zar)As Average_Marketvalue
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by nationality;

---------------------------------------------------------------------
--14. Determine how many player contracts end in each year. 
Select Contract_end_year,
COUNT(contract_end_year) As Contract_ofyear 
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by contract_end_year;

------------------------------------------------------------
----15. Identify players whose contracts end next year
Select Player_name,
Contract_end_year
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
where contract_end_year =2027;

-------------------------------------------------------------
--------16. Summarize the number of players by injury status. 
SElect injury_status,
count(injury_status)AS Injury
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
group by injury_status;
-------------------------------------------------------------------------
---17. Calculate goals per match ratio for each player. 
Select Player_name,
Goals,
matches_played
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced];

------------------------------------------------------------------------
---18. Count how many players are managed by each agent. 
Select Agent,
count (agent)As Player_magaged_byAgents
FROM [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
where agent !='None'
group by Agent;

-----------------------------------------------------------------------
-------------19. Calculate average height and weight by player position. 
SELECT Position,
AVG(Height_cm)AS AVGHeight,
AVG(Weight_kg)AS AVGWeight
From [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
Group by Position
Order by Position;

---------------------------------------------------------------------
------20. Identify players with the highest combined goals and assists.
Select Player_name,
Goals+Assists As TotalCombination
From [soccer analysis db1].[dbo].[ketro_sa_soccer_dataset_advanced]
Order by TotalCombination DESC;

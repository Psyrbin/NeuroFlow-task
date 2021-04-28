SELECT Providers.organization_name 
FROM Providers join Phq9 on Providers.provider_id = Phq9.provider_id
GROUP BY Providers.organization_name 
ORDER BY AVG(Phq9.score) DESC
LIMIT 5
SELECT FORMAT(users.created_at,"YYYY-MM") AS cohort, COUNT(sq.tmp) / COUNT(users.user_id)
FROM users LEFT JOIN (
	/* subquery that selects users which completed an exercise in their first month */
	SELECT user_id, 1 AS tmp 
	FROM users JOIN exercises ON users.user_id = exercises.user_id
	GROUP BY users.user_id
	HAVING DATEDIFF(day, users.created_at, MIN(exercises.exercise_completion_date)) <= 30
) sq on  users.user_id = sq.user_id
GROUP BY FORMAT(users.created_at,"YYYY-MM")
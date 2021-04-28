SELECT ex_count, COUNT(id) 
FROM (
	/* Get number of completed exercises per user*/
	SELECT users.user_id AS id, COUNT(exercises.exercise_id) AS ex_count
	FROM users JOIN exercises ON users.user_id = exercises.user_id
	GROUP BY users.user_id
)
GROUP BY ex_count
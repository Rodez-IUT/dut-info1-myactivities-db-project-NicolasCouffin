SELECT title,description,username
FROM activity
LEFT OUTER JOIN "user" U
ON owner_id = U.id
WHERE creation_date < '01/09/2019'
ORDER BY title, username
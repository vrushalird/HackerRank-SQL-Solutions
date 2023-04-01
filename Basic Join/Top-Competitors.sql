SELECT H.hacker_id, H.name FROM Hackers H
JOIN Submissions As Su ON Su.hacker_id = H.hacker_id
JOIN Challenges As Ch ON Ch.challenge_id = Su.challenge_id
JOIN Difficulty As Di ON Di.difficulty_level = Ch.difficulty_level

WHERE Di.score = Su.score AND Di.difficulty_level = Ch.difficulty_level
GROUP BY H.hacker_id, H.name
HAVING COUNT(Su.submission_id) > 1
ORDER BY COUNT(Su.submission_id) DESC, H.hacker_id ASC;
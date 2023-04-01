SELECT C.hacker_id, H.name, COUNT(C.challenge_id) AS total FROM Hackers H
JOIN Challenges C 
ON C.hacker_id = H.hacker_id
GROUP BY C.hacker_id, H.name
HAVING  total = (SELECT COUNT(c1.challenge_id) FROM Challenges c1 GROUP BY c1.hacker_id ORDER BY count(*) DESC LIMIT 1) OR 
        total NOT IN (SELECT COUNT(c2.challenge_id) FROM Challenges c2 GROUP BY c2.hacker_id HAVING c2.hacker_id <> C.hacker_id)
ORDER BY total DESC, C.hacker_id;
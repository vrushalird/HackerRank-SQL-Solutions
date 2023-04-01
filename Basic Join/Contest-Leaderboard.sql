SELECT H.hacker_id, H.name, SUM(mscore) From Hackers H
JOIN 
( SELECT S.hacker_id, MAX(S.score) AS mscore FROM Submissions S GROUP BY S.hacker_id, S.challenge_id) Sb ON H.hacker_id = Sb.hacker_id
GROUP BY H.hacker_id, H.name
HAVING SUM(mscore)>0

ORDER BY Sum(mscore) DESC, H.hacker_id ASC;
SELECT  Ct.contest_id, 
        Ct.hacker_id, 
        Ct.name, 
        SUM(total_submissions), 
        SUM(total_accepted_submissions), 
        SUM(total_views), 
        SUM(total_unique_views) 
FROM Contests Ct
JOIN Colleges Cl ON Ct.contest_id = Cl.contest_id 
JOIN Challenges Ch ON Cl.college_id = Ch.college_id 
LEFT JOIN 
    (
        SELECT challenge_id, SUM(total_views) AS total_views,                         SUM(total_unique_views) AS total_unique_views FROM View_Stats GROUP           BY challenge_id
    ) Vs ON Ch.challenge_id = Vs.challenge_id
LEFT JOIN
    (
        SELECT challenge_id, SUM(total_submissions) AS total_submissions,             SUM(total_accepted_submissions) AS total_accepted_submissions FROM           Submission_Stats GROUP BY challenge_id
    ) Ss ON Ch.challenge_id = Ss.challenge_id
GROUP BY Ct.contest_id, Ct.hacker_id, Ct.name
HAVING  SUM(total_submissions) != 0 OR 
        SUM(total_accepted_submissions) != 0 OR 
        SUM(total_views) != 0 OR 
        SUM(total_unique_views) != 0

ORDER BY contest_id; 

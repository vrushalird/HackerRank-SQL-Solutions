SELECT SUBMISSION_DATE,
       (SELECT Count(DISTINCT hacker_id) as no_of_unique_hacker_id FROM submissions S2
        WHERE  S2.submission_date = S1.submission_date
        AND (SELECT Count(DISTINCT S3.submission_date)
             FROM   submissions S3
             WHERE  S3.hacker_id = S2.hacker_id
             AND S3.submission_date < S1.submission_date
        ) = Datediff(S1.submission_date, '2016-03-01')
       ) AS NO_OF_UNIQUE_HACKERS,
       (SELECT hacker_id FROM submissions S2
        WHERE  S2.submission_date = S1.submission_date
        GROUP  BY hacker_id
        ORDER  BY Count(submission_id) DESC, hacker_id ASC LIMIT  1
       ) AS MAX_SUB_HACKER_ID,
       (SELECT name FROM hackers
        WHERE  hacker_id = MAX_SUB_HACKER_ID
       ) AS NAME
FROM   (SELECT DISTINCT submission_date FROM submissions) S1
GROUP BY submission_date;
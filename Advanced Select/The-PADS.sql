SELECT CONCAT(Name,"(",LEFT(Occupation,1),")") FROM OCCUPATIONS ORDER BY Name;
SELECT "There are a total of ", COUNT(Occupation) AS cnt, LOWER(CONCAT(Occupation,"s.")) FROM OCCUPATIONS GROUP BY Occupation ORDER BY cnt, Occupation;
SELECT S.NAME FROM Students S
JOIN Friends F ON S.ID = F.ID
JOIN Packages P ON P.ID = S.ID
JOIN Packages FP ON FP.ID = F.Friend_ID
WHERE P.Salary <= FP.Salary
ORDER BY FP.Salary;
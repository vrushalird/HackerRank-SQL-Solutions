SELECT f1.X, f1.Y
FROM Functions f1, Functions f2
WHERE f1.X <= f1.Y
AND f1.X = f2.Y
AND f2.X = f1.Y
GROUP BY f1.X, f1.Y
HAVING count(CASE WHEN f1.X=f1.Y THEN f1.X END)>2
OR count(CASE WHEN f1.X<f1.Y THEN f1.X END)=1
ORDER BY f1.X, f1.Y;
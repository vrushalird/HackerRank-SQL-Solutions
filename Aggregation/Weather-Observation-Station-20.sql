SELECT ROUND(S1.LAT_N,4) FROM STATION S1 WHERE (SELECT ROUND(COUNT(S1.ID)/2)-1 FROM STATION) = (SELECT COUNT(S2.ID) FROM STATION S2 WHERE S2.LAT_N > S1.LAT_N);
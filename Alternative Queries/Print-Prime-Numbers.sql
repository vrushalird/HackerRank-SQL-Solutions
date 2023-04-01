SELECT GROUP_CONCAT(NUMB SEPARATOR '&')
FROM
(
    SELECT @num:=@num+1 as NUMB FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) numbers
WHERE NUMB<=1000 AND NOT EXISTS 
    (
        SELECT * FROM 
        (
            SELECT @n:=@n+1 as NUMA FROM
            information_schema.tables t1,
            information_schema.tables t2,
            (SELECT @n:=1) tmp1
            LIMIT 1000
        ) prm WHERE FLOOR(NUMB/NUMA) = (NUMB/NUMA) AND NUMA<NUMB AND NUMA>1
    )


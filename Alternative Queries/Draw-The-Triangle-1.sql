SET @N = 20 + 1;

SELECT REPEAT('* ', @N := @N-1) FROM INFORMATION_SCHEMA.TABLES; 
SET @N = 0;
SELECT REPEAT('* ', @N := @N + 1) FROM information_schema.tables LIMIT 20;
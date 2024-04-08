-- Session 1:
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM wallet WHERE balance >= 1000;
-- Don't commit yet.

-- Session 2:
BEGIN;
INSERT INTO wallet (balance) VALUES (1500);
COMMIT;

-- Session 1:
SELECT * FROM wallet WHERE balance >= 1000; -- The new row will not be visible at this isolation level.
COMMIT;

-- Session 1:
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT balance FROM wallet WHERE id = 1;
-- Don't commit yet.

-- Session 2:
BEGIN;
UPDATE wallet SET balance = balance + 100 WHERE id = 1;
COMMIT;

-- Session 1:
SELECT balance FROM wallet WHERE id = 1; -- The value may have changed since the first read.
COMMIT;

-- Session 1:
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;
SELECT balance FROM wallet WHERE id = 1;
-- Don't commit yet.

-- Session 2:
START TRANSACTION;
UPDATE wallet SET balance = balance + 100 WHERE id = 1;
COMMIT;

-- Session 1:
SELECT balance FROM wallet WHERE id = 1; -- This will show the updated balance.
COMMIT;

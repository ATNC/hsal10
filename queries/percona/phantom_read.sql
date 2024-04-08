-- Session 1:
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM wallet WHERE balance >= 1000;
-- Don't commit yet.

-- Session 2:
START TRANSACTION;
INSERT INTO wallet (user_id, balance) VALUES ('124', 1500);
COMMIT;

-- Session 1:
SELECT * FROM wallet WHERE balance >= 1000; -- This may or may not show the new row, depending on if the snapshot was taken before or after the INSERT.
COMMIT;

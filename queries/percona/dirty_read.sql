-- Session 1:
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
SELECT balance FROM wallet WHERE id = 1;

-- Session 2:
START TRANSACTION;
UPDATE wallet SET balance = balance - 100 WHERE id = 1;
-- Do not commit or rollback in Session 2 yet.

-- Now, Session 1 would see the uncommitted change if you re-run the SELECT query.

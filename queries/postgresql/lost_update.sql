-- Session 1:
BEGIN;
SELECT balance FROM wallet WHERE id = 1 FOR UPDATE;
UPDATE wallet SET balance = balance + 100 WHERE id = 1;
-- Don't commit yet.

-- Session 2:
-- This session must wait for Session 1 to commit if using row-level locking.
BEGIN;
SELECT balance FROM wallet WHERE id = 1 FOR UPDATE;
UPDATE wallet SET balance = balance + 200 WHERE id = 1;
COMMIT;

-- Session 1:
-- Session 1's update will not be lost; it will be applied on top of Session 2's update after it commits.
COMMIT;

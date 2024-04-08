-- Session 1:
START TRANSACTION;
SELECT balance FROM wallet WHERE id = 1 FOR UPDATE;
UPDATE wallet SET balance = balance + 100 WHERE id = 1;
-- Don't commit yet.

-- Session 2:
-- This session must wait for Session 1 to commit if using row-level locking.
START TRANSACTION;
UPDATE wallet SET balance = balance + 200 WHERE id = 1;
COMMIT;

-- Session 1:
-- If Session 1 now commits, the update from Session 1 might be lost if the database does not handle row-level locking properly.
COMMIT;

# Database Isolation Levels

This project demonstrates the effects of different transaction isolation levels in SQL databases. The examples provided cover PostgreSQL and Percona.

## Autocommit Setting

In the `my.cnf` configuration file for Percona, you may notice the line `autocommit=0`. This setting is important for the behavior of transactions in our examples.

Autocommit is a mode in SQL databases where each individual SQL statement is treated as a transaction and is automatically committed right after it is executed. By setting `autocommit=0`, we disable this mode. This means that multiple SQL statements can be executed in a single transaction that must be manually committed. This is necessary for our examples, as each session involves multiple SQL statements that need to be executed in the same transaction.

Remember to manually commit your transactions in each session with the `COMMIT;` statement. If you forget to do this, your changes will not be saved to the database.
## Usage
 
To see these examples in action, you'll need to open two separate database consoles. This can usually be done through your database's command line interface or GUI.

Here's a step-by-step guide:

1. Open your first database console. This will be used for Session 1 queries.

2. Open your second database console. This will be used for Session 2 queries.

3. Navigate to the SQL file you want to test. For example, if you want to test non-repeatable reads 
in PostgreSQL, you would open `queries/postgresql/non_repeatable_read.sql`.

4. Copy the Session 1 queries from the SQL file and paste them into your first database console. Do not commit yet.

5. Copy the Session 2 queries from the same SQL file and paste them into your second database console. 
Execute these queries and commit.

6. Go back to your first database console and continue executing the remaining Session 1 queries. Commit when done.

Remember, the effects you see will depend on the isolation level set at the beginning of each transaction. 
Refer to the tables in this README for a summary of what to expect 
at each isolation level for both PostgreSQL and Percona.


## Percona
| Isolation Level    | Dirty Read | Non-repeatable Read | Phantom Read |
|--------------------|:----------:|:-------------------:|:------------:|
| Read Uncommitted   | yes        | yes                 | yes          |
| Read Committed     | no         | yes                 | yes          |
| Repeatable Read    | no         | no                  | yes*         |
| Serializable       | no         | no                  | no           |

*In the default InnoDB engine, a next-key locking mechanism prevents phantom reads 
at the Repeatable Read level, but they are still theoretically possible.

| Isolation Level    | Lost Update Possible |
|--------------------|:--------------------:|
| Read Uncommitted   | yes                  |
| Read Committed     | possible**           |
| Repeatable Read    | no                   |
| Serializable       | no                   |

**Under Read Committed, lost updates are less likely due to more 
granular locking but may still be possible in certain race conditions.



## PostgreSQL
| Isolation Level    | Dirty Read | Non-repeatable Read | Phantom Read |
|--------------------|:----------:|:-------------------:|:------------:|
| Read Uncommitted*  | no         | yes                 | yes          |
| Read Committed     | no         | yes                 | yes          |
| Repeatable Read    | no         | no                  | yes          |
| Serializable       | no         | no                  | no           |

*In PostgreSQL, READ UNCOMMITTED is treated as READ COMMITTED.

| Isolation Level    | Lost Update Possible |
|--------------------|:--------------------:|
| Read Uncommitted*  | no                   |
| Read Committed     | no                   |
| Repeatable Read    | no                   |
| Serializable       | no                   |

*In PostgreSQL, READ UNCOMMITTED is treated as READ COMMITTED.

# Session 14

## PG - WAL and backups

1. WAL 
	1. We can sacrifice WAL in case we don't need data reliability.
	2. If DB is full, we'll have issues with clearing the same since additional storage will be needed in order to delete old records. This is a tricky situation to handle.
2. Backups
	1. Physical backup
	2. Logical backup
3. pg_dumpall
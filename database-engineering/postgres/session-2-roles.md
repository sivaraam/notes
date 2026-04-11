# Session 2 - Roles and SELECT

## Notes

### Roles

- Everything is a role in postgres. Even users and groups are roles. 
  - Users have additional ability to login.
- `GRANT` command is used to give permissions to roles

### SELECT

- Some discussion about simple SELECT queries / SELECT DISTINCT.
- Pagination
  - Using LIMIT .. OFFSET
  - Using FETCH NEXT n ROWS ONLY OFFSET m ROWS
  - Mentioned Cursor based pagination
- Query with IN / NOT IN
- Query with LIKE / ILIKE / REGEX
  - Case sensitive: `SELECT * FROM tab WHERE col ~ '^[A].*$' LIMIT 10;`
  - Case insensitive: `SELECT * FROM tab WHERE col *~ '^[a].*$' LIMIT 10;`
 

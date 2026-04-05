# Session 11

## PG - Index

- Hash index
- B-tree index
- Unique index
- Partial index

### Indices and queries

If you're good at knowing how indexes and queries work, it'll help you a lot in your career.

### Claude - PostgreSQL Index Types — Summary

Note: Not all types were mentioned during session.

#### B-Tree _(default)_

- **Use for:** equality (`=`), range (`<`, `>`, `BETWEEN`), sorting, `LIKE 'foo%'`
- **Pros:** general purpose, well-optimized, supports most operators
- **Cons:** bloats on write-heavy tables (needs `VACUUM`), not great for complex data types
- **Default** — if unsure, use this


#### Hash

- **Use for:** equality-only (`=`) lookups
- **Pros:** faster than B-Tree for pure equality checks
- **Cons:** can't do ranges or sorting, not WAL-logged before Postgres 10 (unsafe), rarely worth it over B-Tree
- **Verdict:** mostly obsolete in practice


#### GIN _(Generalized Inverted Index)_

- **Use for:** `JSONB`, arrays, full-text search — anything where one row contains _multiple_ indexable values
- **Pros:** very fast lookups on containment (`@>`, `?`, `@@`)
- **Cons:** slow to build/update, high storage cost
- **Pattern:** read-heavy, infrequently updated JSONB or tsvector columns


#### GiST _(Generalized Search Tree)_

- **Use for:** geometric/spatial data, full-text search, range types, nearest-neighbor
- **Pros:** supports complex types and `ORDER BY ... <->` (proximity), lossy = smaller size
- **Cons:** slower lookups than GIN for text search, lossy means heap recheck required
- **Pattern:** PostGIS geometry columns, IP range lookups, fuzzy search with `pg_trgm`


#### BRIN _(Block Range Index)_

- **Use for:** very large tables where data is **naturally ordered** (timestamps, sequential IDs, IoT data)
- **Pros:** tiny size (stores min/max per block range, not per row), cheap to maintain
- **Cons:** only useful if physical storage order correlates with query range — otherwise useless
- **Pattern:** append-only time-series logs, event tables with `created_at`


#### SP-GiST _(Space-Partitioned GiST)_

- **Use for:** non-balanced structures — IP addresses, phone numbers, geometric points, tries
- **Pros:** efficient for data that partitions into non-overlapping spaces
- **Cons:** limited operator support, niche use cases
- **Pattern:** `inet` lookups, quad-tree spatial queries


#### Partial Index

- **Not a type, but a modifier** — add `WHERE` to any index
- **Use for:** indexing only a subset of rows (e.g. `WHERE deleted_at IS NULL`)
- **Pros:** much smaller, faster, avoids indexing irrelevant rows
- **Pattern:** soft deletes, status filters (`WHERE status = 'active'`)


#### Composite Index

- **Also a modifier** — multi-column index
- **Rule:** column order matters — put the most selective / equality-filtered column first
- **Covers** multiple query patterns if designed well


#### Quick Cheat Sheet

|Need|Use|
|---|---|
|General queries, ranges, sorting|**B-Tree**|
|JSONB / array containment|**GIN**|
|Spatial / proximity / ranges|**GiST**|
|Huge append-only time-series table|**BRIN**|
|Filter on a subset of rows|**Partial index**|
|Full-text search|**GIN** (faster) or **GiST** (smaller)|


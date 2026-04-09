# Session 7 - Joins

- INNER JOIN / LEFT JOIN / FULL OUTER JOIN

## Synchronized commit

- Synchronized commit can be turned off. This means we rely more on WAL
  than synchronization. For this case, WAL buffers may be tweaked.

## Index scan vs. Sequential scan

- In some cases Psotgres chooses sequential scan over index scan even
  when index is present. One case:
  - [Why does PostgreSQL perform sequential scan on indexed column?](https://stackoverflow.com/a/5203827/5614968)
  - [Why PostgreSQL Uses Sequential Scan Even If Index Exists](https://towardsdev.com/why-postgresql-uses-sequential-scan-even-if-index-exists-19b439bb7c7f)
    -  Low Selectivity - large numbers of rows matched due to query
    - Small Table Size - table can fit in memory or scanned quickly
    - Missing Statistics - outdate stats lead to misestimated matching rows
    - Parallel execution - seq. scan can be parallelized. index scan cannot be.
    - Function Usage or Type Mismatch - when functions are applied, only fuctional indices can be used for the query

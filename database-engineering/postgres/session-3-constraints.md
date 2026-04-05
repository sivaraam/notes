## Session 3 - Constraints

- We can add constaints in database.
  - CHECK
  - UNIQUE
- Queries
  - TRUNCATE
  - DELETE
- Serial number will be skipped when insertion fails
  owing to a constraint failure

### General tips

- Normalization is a double-edged sword. Do it carefully.
  You need to be mindful about the querying patterns like
  the amount of joins that may be involved owing to
  normalization and the cost of the same.

  What kind of normalization is needed purely depeds on
  your use-case and querying patterns.
- Vector DB can be used to build search engine

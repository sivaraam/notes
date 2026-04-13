# Session 18 - Redis Python

- Redis uses logical seggregation similar to the databases in Postgres.
  It is an additional mechanism to feed in data to separate places to
  keep them separate.
- Redis is single threaded. It handles concurrency by serializaing operations.
  - Follow up doubt: Is there no parallel mechanism in Redis? How is
    it able to handle scale while being serial?

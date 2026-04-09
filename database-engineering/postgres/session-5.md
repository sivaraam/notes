# Session 5 - ACID

## Isolation level

- Decide on what kind of trade-off is fine to
  decide which transaction should succeed amongst
  two concurrent transactions touching the same
  things.
- Two kind of isolation levels
  - Repeatable read.
  - Serializable
- Common problems
  - Dirty read
  - Phantom read
    - Can be solved using the above two isolation
      levels

## Atomicity

- We can have check points a.k.a save points in
  transactions.
- Will commit affect data in disk or buffer?
  - Once committed, data will be in buffer.
  - Once checkpointed, data will be written to disk.
- Use does not concern whether the stuff is in buffer or disk.

## Durability

Elements related to durability:

- Write Ahead Logging
- fsync & synchronous commit
- Backups
- Point in time recovery

## Consistency

- Getting consistent data despite having replicas etc.


## Misc.

- BASE - equivalent to ACID in NoSQL
  - Eventual consistency
  - NoSQL - does not require schema which is the primary advantage


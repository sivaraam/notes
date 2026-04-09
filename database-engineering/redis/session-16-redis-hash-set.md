# Session 16 - Array / Hash map / Set / Zset  

- Redis supports durable storage also. Also, support replication etc.
- Type is not explicitly in Redis. It is set based on
  how first insertion is done to the key.
- Images can be stored in Redis as values when they are
  base64 encoded.
- Valkey is a fork of Redis that sprung due to its intermediate switch to SSPL
  - Ref: https://betterstack.com/community/comparisons/redis-vs-valkey/
  - Since Mar 2025, it switched back over to AGPL v3
    - Ref: https://lwn.net/Articles/1019686/


## Array

- Can be used as stack / queue

### Commands

- LPUSH / LPOP
- LGET
- RPUSH / RPOP
- RGET
- LLEN
- LRANGE

## Hash set

- Hash set
- Has an overlap with namsepaced trivial keys that are created and accessed via SET / GET

### Commands

- HSET
- HGET

## Set

- It contains only unique values.
- It is unordered

### Commands

- SADD - Add item to a Redis set

  `SADD users "a", "b", "c"`

- SMEMBERS - Get members of a set

  `SMEMBERS users`

- SISMEMBER - Checks whether value is member of a set

  `SISMEMBER users "a"`

## ZSet

- It is a SET but "Ordered"
- Automatically sorted in ascending order

### Commands

- ZSETADD - Add item to a set

- ZRANGE - Fetch range of items from ordered set

  `ZRANGE zset 0 -1` - fetch all items in set (inclusive)

- ZREVRANGE - Fetch range of items from ordered set (in descending order)

## Others

- Namespace is crucial in Redis. It needs to be defined well.

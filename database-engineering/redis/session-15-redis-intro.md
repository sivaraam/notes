# Session 16 - Redis

In memory server - Key Value pair

## Commands

- SET
- GET
- DEL
- TTL

## Namespace

The redis supports namespaces. Names are unique in redis. The namespace in redis allows to create unique names.

## Expiry of entries

- EX clause in SET to set expiry
    - SET name "hello" EX 30
- TTL to fetch the expiry of the document.
    - TTL name

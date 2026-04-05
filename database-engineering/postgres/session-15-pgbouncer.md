# Session 15

## PG bouncer

- The amount of connections we can open with Postgres is limited. 
- Opening a new connection requires some I/O overhead.
- Connection pooling helps reduce overhead.
- Connection pooling has a relation with the background worker pool in Postgres.
  - DDG summary - Connection pooling in PostgreSQL allows multiple client applications to share a limited number of database connections, improving resource efficiency and performance. A worker pool can manage these connections, ensuring that each worker can quickly access a connection without the overhead of establishing a new one for every request.
- Connection pooling is a programmatic way. PG bouncer is a software to achieve this.
- Alternative to connection pooling is to use PG bouncer to manage connections automatically.
- PG bouncer can be configured to only connect to specific DB, user creds. Then it runs in port 6432. So, applications connect to 6432 instead of 5432. PG bouncer manages the connections.
- It can be configured to limit the number of connections.
- **Claude**
	- Connection pool and PgBouncer are complimentary.
	- Connection pooling pools HTTP connection to database / PgBouncer
	- PgBouncer pools connections to Postgres

### Claude concise notes - PgBouncer vs Connection Pooling

**App-level pools** (pg-pool, HikariCP, etc.) live inside each app process. Problem: 50 instances × 10 connections = 500 Postgres connections, and Postgres spawns a process per connection (~5–10MB RAM each).

**PgBouncer** is a proxy that sits between your apps and Postgres, so all instances share one small real connection pool.

---

**PgBouncer's 3 modes:**
- **Session** — 1 real connection per client session (safest, drop-in)
- **Transaction** — connection borrowed only during a transaction, then released ✅ most useful
- **Statement** — released after every statement (rarely used)

---

**PgBouncer limitations (transaction mode):**
- `SET`/session vars don't persist
- Named prepared statements break
- `LISTEN/NOTIFY` requires session mode
- Adds a small network hop

---

**Best practice: use both together**
```
App pool (2–5 conns) → PgBouncer → Postgres
```
- App pool avoids TCP overhead to PgBouncer on every query
- PgBouncer keeps Postgres connections low globally
- **Lower your app pool size** when PgBouncer is in front

---

**Use PgBouncer when:**
- Running multiple app replicas/containers
- Using serverless (Lambda, etc.) — nearly essential
- Hitting Postgres connection limits


## Other resources

- Load testing
  - K6 framework: https://k6.io/
  - Locust: https://locust.io/
    - Templates
      - https://github.com/syedjaferk/locust_tech_meet
      - https://github.com/syedjaferk/locust-load-testing/blob/main/templates/api_test_template.py
    
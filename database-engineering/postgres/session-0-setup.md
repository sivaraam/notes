# Session 0 - DB setup

This just contains notes from the steps I took in order to setup Postgres locally.

Installed via:

```bash
sudo apt install postgresql
```

## Create a new user who can create databases

Ref: https://phoenixnap.com/kb/postgres-create-user

```bash
sudo -u postgres createuser --interactive
```

### Sample options chosen

```bash
Enter name of role to add: pg
Shall the new role be a superuser? (y/n) n
Shall the new role be allowed to create databases? (y/n) y
Shall the new role be allowed to create more new roles? (y/n) n
```

### Set the password for the user

1. Login to PostgreSQL as default postgres user.

  ```bash
  sudo -u postgres psql
  ```

2. Set the password

  ```sql
  ALTER USER pg WITH PASSWORD '<your_password>';
  ```

3. Ensure scram-sha-256 method of login is enabled for local connections in `/etc/pg_hba.conf`

  ```conf
  local   all             all                                     scram-sha-256
  ```

  **Note**: We can alternatively use `peer` method but that would require setting appropriate
  creation previleges to the corresponding local user account role. This needs some research.

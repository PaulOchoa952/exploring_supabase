# Database Setup and Migration Guide

## Step 1: Create a Database

1. Create a database called `patients` in your container, then copy this database to Supabase using the `database.sql` file.

## Step 2: Install Supabase CLI

1. Install the Supabase CLI:
    ```sh
    npx supabase init  # Create a new local project
    npx supabase start  # Launch the Supabase services
    ```

2. Run Supabase locally:
    ```sh
    npx supabase init
    npx supabase start
    ```

3. Manage database migrations:
    ```sh
    supabase migration
    ```

4. CI/CD for releasing to production:
    ```sh
    supabase db push
    ```

## Requirements

- Docker
- Supabase

## Commands for PostgreSQL Container

1. Pull the PostgreSQL image:
    ```sh
    docker pull postgres
    ```

2. Start the PostgreSQL container:
    ```sh
    docker run --name my_postgres -e POSTGRES_PASSWORD=my_password -d postgres
    ```

3. Access the PostgreSQL terminal:
    ```sh
    docker exec -it my_postgres psql -U postgres
    ```

Replace `my_password` with your desired password for the `postgres` user.

## Create and Use the Database

1. Create the database:
    ```sql
    CREATE DATABASE your_database_name;
    ```

2. Switch to the database (exit the current psql session if needed and reconnect to the specific database):
    ```sh
    \c your_database_name
    ```

## Database Migration Between Containers

1. Dump the database from the source container:
    ```sh
    docker exec -t my_postgres pg_dump -U postgres -d patients -F p > C:\Users\p_a_u\backup.sql
    ```

2. Identify the PostgreSQL container name (e.g., `supabase_db_supabase`).

3. Copy the `backup.sql` file to the PostgreSQL container:
    ```sh
    docker cp C:\Users\p_a_u\backup.sql supabase_db_supabase:/var/lib/postgresql/data/backup.sql
    ```

4. Verify the file was copied correctly:
    ```sh
    docker exec -it supabase_db_supabase ls /var/lib/postgresql/data/
    ```

## Restore the Database from Backup

1. List the databases in the container to verify the target database name:
    ```sh
    docker exec -it supabase_db_supabase psql -U postgres -l
    ```

2. Restore the database using the backup file:
    ```sh
    Get-Content -Path C:\Users\p_a_u\backup.sql | docker exec -i supabase_db_supabase psql -U postgres -d patients
    docker exec -i supabase_db_supabase psql -U postgres -d patients < C:\Users\p_a_u\backup.sql
    ```

3. Confirm the restoration was successful by checking the tables and data:
    ```sh
    docker exec -it supabase_db_supabase psql -U postgres -d patients -c "\dt"
    ```

## Summary

By following these steps, you should be able to restore the database from the backup file you copied. If you encounter any issues or have further questions, feel free to ask!

PS C:\Users\p_a_u\desktop\supabase> docker exec -t supabase_db_supabase pg_dump -U postgres -d patients -f /tmp/patients_backup.sql
PS C:\Users\p_a_u\desktop\supabase> docker cp supabase_db_supabase:/tmp/patients_backup.sql C:\Users\p_a_u\desktop\supabase\
PS C:\Users\p_a_u\desktop\supabase> docker exec -i supabase_db_supabase psql -U postgres -d postgres -f /tmp/patients_backup.sql
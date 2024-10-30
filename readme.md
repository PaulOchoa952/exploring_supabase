Create a database call patients in my container,then try to copy this db to
supabase
---------
comands:
---------
install de supabase CLI
supabase init to create a new local project
supabase start to launch the Supabase services
--------------------
Run Supabase locally: supabase init and supabase start
Manage database migrations: supabase migration
CI/CD for releasing to production: supabase db push
---------
requirements:
docker and supabase

Aquí tienes los comandos para descargar, levantar un contenedor de PostgreSQL y entrar a la terminal del mismo:

1. Descargar la imagen de PostgreSQL:
    ```sh
    docker pull postgres
    ```

2. Levantar un contenedor de PostgreSQL:
    ```sh
    docker run --name mi_postgres -e POSTGRES_PASSWORD=mi_contraseña -d postgres
    ```

3. Entrar a la terminal del contenedor:
    ```sh
    docker exec -it mi_postgres psql -U postgres
    ```

Asegúrate de reemplazar `mi_contraseña` con la contraseña que desees usar para el usuario [`postgres`]

In PostgreSQL, you create a database with the CREATE DATABASE command. However, unlike some other database systems, you don’t “use” the database directly within the same session after creating it.

Here’s how it works:

Create the database:

copy the code from the file database.sql
CREATE DATABASE your_database_name;
Switch to the database (exit the current psql session if needed and reconnect to the specific database):

bash
Copiar código
\c your_database_name

To perform a database migration between two PostgreSQL containers without using an extra UI like pgAdmin, you can use the `pg_dump` and `pg_restore` commands. Here are the steps:

1. **Dump the database from the source container:**
   ```sh
   This command will specify with -F p that the backup its generated with an SQL format:
docker exec -t my_postgres pg_dump -U postgres -d PATIENTS -F p > C:\Users\p_a_u\backup.sql
   ```

2. **Identify the PostgreSQL container name:**

------
it's supabase_db_supabase
-----
Once you’ve identified the name of the PostgreSQL container (e.g., it might be supabase-db), you can use this name in the docker cp command.

Copy the backup.sql file to the PostgreSQL container:

Replace your_postgres_container_name with the actual container name you identified:

bash
Copiar código
docker cp backup.sql your_postgres_container_name:/var/lib/postgresql/da

2. **Copy backup.sql to the target container (supabase):**

This will migrate the database from the source container to the target container.

docker cp C:\Users\p_a_u\backup.sql supabase_db_supabase:/var/lib/postgresql/data/backup.sql

c:\Users\p_a_u
Replace /path/in/container/ with the desired directory inside the supabase container where you want to store backup.sql (e.g., /var/lib/postgresql/data/backup.sql).

3.verify it gets copy correctly
PS C:\Users\p_a_u> docker exec -it supabase_db_supabase ls /var/lib/postgresql/data/
PG_VERSION    pg_dynshmem    pg_notify     pg_stat_tmp  pg_xact
backup.sql    pg_hba.conf    pg_replslot   pg_subtrans  postgresql.auto.conf
base          pg_ident.conf  pg_serial     pg_tblspc    postgresql.conf
global        pg_logical     pg_snapshots  pg_twophase  postmaster.opts
pg_commit_ts  pg_multixact   pg_stat       pg_wal       postmaster.pid
---------------------------------------------
¡Excelente! Ya tienes el archivo backup.sql en tu contenedor de Supabase. Ahora puedes proceder a restaurar la base de datos desde ese archivo. Aquí tienes los pasos para hacerlo:

Restaurar la base de datos desde el backup
Verifica el nombre de la base de datos donde deseas restaurar el backup. Si no estás seguro, puedes listar las bases de datos en el contenedor usando el siguiente comando:

bash
Copiar código
docker exec -it supabase_db_supabase psql -U postgres -l
Esto te mostrará una lista de todas las bases de datos disponibles.

Restaurar la base de datos usando el archivo de backup. Supongamos que quieres restaurar la base de datos llamada nombre_de_la_base_de_datos. Ejecuta el siguiente comando (reemplaza nombre_de_la_base_de_datos con el nombre real):

bash
Copiar código
Get-Content -Path C:\Users\p_a_u\backup.sql | docker exec -i supabase_db_supabase psql -U postgres -d patients
docker exec -i supabase_db_supabase psql -U postgres -d patients < C:\Users\p_a_u\backup.sql

Confirma que la restauración se realizó correctamente. Puedes verificar las tablas y datos en la base de datos para asegurarte de que todo esté en orden:

bash
Copiar código
docker exec -it supabase_db_supabase psql -U postgres -d nombre_de_la_base_de_datos -c "\dt"
Este comando te mostrará las tablas en la base de datos especificada.

Resumen
Siguiendo estos pasos, deberías poder restaurar la base de datos desde el archivo de backup que copiaste. Si encuentras algún problema o tienes más preguntas, ¡no dudes en preguntar!

PS C:\Users\p_a_u\desktop\supabase> docker exec -t supabase_db_supabase pg_dump -U postgres -d patients -f /tmp/patients_backup.sql
PS C:\Users\p_a_u\desktop\supabase> docker cp supabase_db_supabase:/tmp/patients_backup.sql C:\Users\p_a_u\desktop\supabase\
PS C:\Users\p_a_u\desktop\supabase> docker exec -i supabase_db_supabase psql -U postgres -d postgres -f /tmp/patients_backup.sql
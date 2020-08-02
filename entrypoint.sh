#!/bin/bash
# Docker entrypoint script.

#Wait until Postgres is ready


while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done


./prod/rel/poc_elixir_docker_app/bin/poc_elixir_docker_app eval PocElixirDockerApp.Release.migrate

./prod/rel/poc_elixir_docker_app/bin/poc_elixir_docker_app start
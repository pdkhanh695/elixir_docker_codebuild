#!/bin/bash
# Docker entrypoint script.

#Wait until Postgres is ready

# export APP_PORT=4000
# export APP_HOSTNAME=localhost
# export DB_USER=postgres
# export DB_PASSWORD=postgres
# export DB_HOST=postgres.chjup0ji0a5y.us-east-1.rds.amazonaws.com
# export SECRET_KEY_BASE=FgpNsLszr+jdqyiHytZQNZ+FXUCK1yIUJEPUOUtJXEZK91ju/jFaGjwYaQDSQCkM

while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done


./prod/rel/poc_elixir_docker_app/bin/poc_elixir_docker_app eval PocElixirDockerApp.Release.migrate

./prod/rel/poc_elixir_docker_app/bin/poc_elixir_docker_app start
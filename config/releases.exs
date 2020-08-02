import Config

secret_key_base = System.get_env("SECRET_KEY_BASE") #System.fetch_env!("SECRET_KEY_BASE")
app_port = System.get_env("APP_PORT") #System.fetch_env!("APP_PORT")
app_hostname = System.get_env("APP_HOSTNAME") #System.fetch_env!("APP_HOSTNAME")
db_user = System.get_env("DB_USER") #System.fetch_env!("DB_USER")
db_password = System.get_env("DB_PASSWORD") #System.fetch_env!("DB_PASSWORD")
db_host = System.get_env("DB_HOST") #System.fetch_env!("DB_HOST")

config :poc_elixir_docker_app, PocElixirDockerAppWeb.Endpoint,
  http: [:inet6, port: String.to_integer(app_port)],
  secret_key_base: secret_key_base

config :poc_elixir_docker_app,
  app_port: app_port

config :poc_elixir_docker_app,
  app_hostname: app_hostname

# Configure your database
config :poc_elixir_docker_app, PocElixirDockerApp.Repo,
  username: db_user,
  password: db_password,
  database: "db_prod",
  hostname: db_host,
  pool_size: 10
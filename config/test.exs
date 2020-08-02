use Mix.Config

# Configure your database
config :poc_elixir_docker_app, PocElixirDockerApp.Repo,
  # username: "postgres",
  # password: "postgres",
  # database: "poc_elixir_docker_app_test",
  # hostname: "localhost",
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poc_elixir_docker_app, PocElixirDockerAppWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

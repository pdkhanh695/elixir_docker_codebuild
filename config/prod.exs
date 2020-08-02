use Mix.Config


config :poc_elixir_docker_app, PocElixirDockerAppWeb.Endpoint,
  url: [host: Application.get_env(:poc_elixir_docker_app, :app_hostname), port: Application.get_env(:poc_elixir_docker_app, :app_port)],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :poc_elixir_docker_app, PocElixirDockerAppWeb.Endpoint, server: true
# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :poc_elixir_docker_app,
  ecto_repos: [PocElixirDockerApp.Repo]

# Configures the endpoint
config :poc_elixir_docker_app, PocElixirDockerAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aq4qU9deLvYYn2N9RZizsmPyvdz6wZqeH8+BPa1C6Um23FkGmjiy2om/RJZ1PCMG",
  render_errors: [view: PocElixirDockerAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PocElixirDockerApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :junit_formatter,
  report_file: "report_file_test.xml",
  print_report_file: true
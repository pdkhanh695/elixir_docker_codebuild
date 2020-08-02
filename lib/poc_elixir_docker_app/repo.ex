defmodule PocElixirDockerApp.Repo do
  use Ecto.Repo,
    otp_app: :poc_elixir_docker_app,
    adapter: Ecto.Adapters.Postgres
end

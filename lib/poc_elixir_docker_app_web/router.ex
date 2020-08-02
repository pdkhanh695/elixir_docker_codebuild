defmodule PocElixirDockerAppWeb.Router do
  use PocElixirDockerAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: PocElixirDockerAppWeb.Schema

    forward "/", Absinthe.Plug, schema: PocElixirDockerAppWeb.Schema
  end
end

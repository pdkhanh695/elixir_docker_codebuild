defmodule PocElixirDockerAppWeb.PageController do
  use PocElixirDockerAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule PocElixirDockerAppWeb.Resolvers.AccountResolver do
  alias PocElixirDockerApp.Accounts
  # Link ref: https://ryanswapp.com/2016/12/03/phoenix-graphql-tutorial-with-phoenix-add-crud-using-mutations/
  
  def list_users(_parent, _args, _resolutions) do
    {:ok, Accounts.list_users()}
  end

  def list_user(_parent,  %{id: id}, _resolutions) do
    {:ok, Accounts.get_user!(id)}
  end

  def create_user(_parent, args, _resolutions) do
    args
    |> Accounts.create_user()
    |> case do
      {:ok, user} ->
        {:ok, user}

      {:error, changeset} ->
        {:error, extract_error_msg(changeset)}
    end
  end

  def delete_user(_, %{id: id}, _resolution) do 
    Accounts.delete_user(Accounts.get_user!(id))
  end

  defp extract_error_msg(changeset) do
    changeset.errors
    |> Enum.map(fn {field, {error, _details}} ->
      [
        field: field,
        message: String.capitalize(error)
      ]
    end)
  end
end

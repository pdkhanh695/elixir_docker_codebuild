defmodule PocElixirDockerApp.Repo.Migrations.UpdateTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string

      timestamps()
    end

  end
end

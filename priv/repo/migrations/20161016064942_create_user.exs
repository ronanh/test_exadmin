defmodule TestExadmin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :role_id, references(:roles, on_delete: :nothing)

      timestamps()
    end
    create index(:users, [:role_id])

  end
end

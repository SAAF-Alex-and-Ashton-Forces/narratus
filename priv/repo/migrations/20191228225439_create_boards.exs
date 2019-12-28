defmodule Narratus.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :private, :boolean, default: false, null: false
      add :title, :string
      add :owner, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:boards, [:owner])
  end
end

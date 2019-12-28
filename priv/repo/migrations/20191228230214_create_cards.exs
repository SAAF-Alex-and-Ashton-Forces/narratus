defmodule Narratus.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :body, :string
      add :hooks, {:array, :string}
      add :parent, references(:cards, on_delete: :nothing)
      add :board, references(:boards, on_delete: :nothing)
      add :author, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:cards, [:parent])
    create index(:cards, [:board])
    create index(:cards, [:author])
  end
end


defmodule Narratus.Repo.Migrations.AddRootToBoards do
  use Ecto.Migration

  def change do
    alter table("boards") do
      add :root, references(:users, on_delete: :nothing)
    end
  end
end

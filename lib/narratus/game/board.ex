defmodule Narratus.Game.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :private, :boolean, default: false
    field :title, :string
    field :root, :id
    field :owner, :id

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:private, :title])
    |> validate_required([:private, :title])
  end
end

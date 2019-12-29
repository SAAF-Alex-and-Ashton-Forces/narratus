defmodule Narratus.Game.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :body, :string
    field :hooks, {:array, :string}
    field :parent, :id
    field :board, :id
    field :author, :id
    
    has_one :boards, Narratus.Game.Board
    
    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:body, :hooks])
    |> validate_required([:body, :hooks])
  end
end

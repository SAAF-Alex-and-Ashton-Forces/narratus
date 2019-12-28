defmodule NarratusWeb.BoardController do
  use NarratusWeb, :controller

  alias Narratus.Game
  alias Narratus.Game.Board

  def index(conn, _params) do
    boards = Game.list_boards()
    render(conn, "index.html", boards: boards)
  end

  def new(conn, _params) do
    changeset = Game.change_board(%Board{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"board" => board_params}) do
    case Game.create_board(board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board created successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    board = Game.get_board!(id)
    render(conn, "show.html", board: board)
  end

  def edit(conn, %{"id" => id}) do
    board = Game.get_board!(id)
    changeset = Game.change_board(board)
    render(conn, "edit.html", board: board, changeset: changeset)
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Game.get_board!(id)

    case Game.update_board(board, board_params) do
      {:ok, board} ->
        conn
        |> put_flash(:info, "Board updated successfully.")
        |> redirect(to: Routes.board_path(conn, :show, board))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", board: board, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Game.get_board!(id)
    {:ok, _board} = Game.delete_board(board)

    conn
    |> put_flash(:info, "Board deleted successfully.")
    |> redirect(to: Routes.board_path(conn, :index))
  end
end

defmodule NarratusWeb.PageController do
  use NarratusWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

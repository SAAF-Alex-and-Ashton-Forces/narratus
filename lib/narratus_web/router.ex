defmodule NarratusWeb.Router do
  use NarratusWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NarratusWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/board", BoardController
    resources "/card", CardController
    resources "/user", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", NarratusWeb do
  #   pipe_through :api
  # end
end

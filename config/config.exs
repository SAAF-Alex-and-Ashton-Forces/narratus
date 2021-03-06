# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :narratus,
  ecto_repos: [Narratus.Repo]

config :narratus, NarratusWeb.Endpoint,
  live_view: [
    signing_salt: "LQgpE6pJWYUpcU21bZGakGNAB7iolZdb"
  ]

# Configures the endpoint
config :narratus, NarratusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "liqmC29WnIm/6jwBREzLeHcVK0CNNBe9Pql88YCr88wWk5LEgU3v+GIKyJqvSXQ6",
  render_errors: [view: NarratusWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Narratus.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

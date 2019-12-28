defmodule Narratus.Repo do
  use Ecto.Repo,
    otp_app: :narratus,
    adapter: Ecto.Adapters.Postgres
end

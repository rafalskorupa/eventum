defmodule Eventum.Repo do
  use Ecto.Repo,
    otp_app: :eventum,
    adapter: Ecto.Adapters.Postgres
end

defmodule Tasktrack.Repo do
    use Ecto.Repo,
      otp_app: :tasktrack,
      adapter: Ecto.Adapters.Postgres
  end
  
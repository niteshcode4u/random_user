defmodule RandomUser.Repo do
  use Ecto.Repo,
    otp_app: :random_user,
    adapter: Ecto.Adapters.Postgres
end

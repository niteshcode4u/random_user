defmodule RandomUser.Schemas.User do
  @moduledoc false
  use Ecto.Schema

  schema "users" do
    field :points, :integer

    timestamps()
  end
end

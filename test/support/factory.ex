defmodule RandomUser.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: RandomUser.Repo

  alias RandomUser.Schemas.User

  @spec user_factory :: User.t()
  def user_factory do
    %User{
      points: Enum.random(1..100),
      inserted_at: NaiveDateTime.utc_now(),
      updated_at: NaiveDateTime.utc_now()
    }
  end
end

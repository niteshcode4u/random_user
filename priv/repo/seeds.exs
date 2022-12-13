# Script for populating the database. You can run it as:
#
# mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RandomUser.Repo.insert!(%RandomUser.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule SeedUser do
  @total_users_to_seed 1_000_000

  def seed do
    # Note: Seeding data into batch by chucking the value `1_000_000` due to
    # max parameters allowed n postgres are - 65535. However,
    # chunking on every 16380 is to make length consistent

    1..@total_users_to_seed
    |> Enum.chunk_every(16380)
    |> Enum.each(fn chunked_numbers ->
      user_attrs_list =
        Enum.map(1..length(chunked_numbers), fn _num ->
          time_now = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

          %{
            inserted_at: time_now,
            updated_at: time_now,
            points: 0
          }
        end)

      RandomUser.Models.User.insert_all(user_attrs_list)
    end)
  end
end

SeedUser.seed()

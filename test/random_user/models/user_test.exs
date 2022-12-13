defmodule RandomUser.Models.UserTest do
  use RandomUser.DataCase

  import RandomUser.Factory

  alias RandomUser.Models.User

  describe "user" do
    test "insert_all/1 Return success after inserting all" do
      # set up
      time_now = NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)

      user_attrs_list = [
        %{
          inserted_at: time_now,
          updated_at: time_now,
          points: :rand.uniform(100)
        }
      ]

      assert {1, nil} == User.insert_all(user_attrs_list)
    end

    test "get_random_users/1 Return empty list when no user available" do
      assert [] == User.get_random_users(1)
    end

    test "get_random_users/1 Return users having points greater than min_number" do
      # set up
      insert_list(10, :user)

      assert users = User.get_random_users(1)

      assert length(users) == 2
      assert hd(users).points > 1
    end

    test "update_all/0 Update all users points" do
      # set up
      insert_list(3, :user)

      assert {3, nil} == User.update_all()
    end
  end
end

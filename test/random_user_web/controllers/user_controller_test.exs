defmodule RandomUserWeb.UserControllerTest do
  use RandomUserWeb.ConnCase, async: false
  import RandomUser.Factory

  describe "get_random_user" do
    test "Returns users list when users exist", %{conn: conn} do
      insert_list(10, :user)

      resp =
        conn
        |> get(Routes.user_path(conn, :get_random_user))
        |> json_response(200)

      assert %{"id" => id, "points" => points} = List.first(resp["users"])
      assert is_integer(id)
      assert is_integer(points)
    end

    test "Returns Empty list if no users available", %{conn: conn} do
      resp =
        conn
        |> get(Routes.user_path(conn, :get_random_user))
        |> json_response(200)

      assert resp["users"] == []
    end
  end
end

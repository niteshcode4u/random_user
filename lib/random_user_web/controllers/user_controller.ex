defmodule RandomUserWeb.UserController do
  use RandomUserWeb, :controller

  def get_random_user(conn, _params) do
    {:ok, results} = RandomUser.get_random_users()

    render(conn, "random.json", %{results: results})
  end
end

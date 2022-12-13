defmodule RandomUserWeb.UserViewTest do
  use RandomUserWeb.ConnCase, async: true

  import Phoenix.View

  test "random.json" do
    assert %{"timestamp" => _timestamp, "users" => [%{id: 1, points: 2}]} =
             render(RandomUserWeb.UserView, "random.json", %{
               results: %{
                 users: [%{id: 1, points: 2}],
                 timestamp: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
               }
             })
  end

  test "user.json" do
    assert render(RandomUserWeb.UserView, "user.json", %{user: %{id: 1, points: 2}}) == %{
             id: 1,
             points: 2
           }
  end
end

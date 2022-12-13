defmodule RandomUserWeb.UserView do
  use RandomUserWeb, :view

  def render("random.json", %{results: results}) do
    %{
      "users" => render_many(results.users, __MODULE__, "user.json"),
      "timestamp" => to_string(results.timestamp)
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      points: user.points
    }
  end
end

defmodule RandomUser do
  @moduledoc """
  RandomUser keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias RandomUser.UserManager

  @spec get_random_users :: {:ok, list}
  @doc """
    Returns the list of 2 users or empty list if no user based on condition

    ## Examples

      iex> UserManager.get_random_users()
      {:ok, [%User{}, %User{}]}

      iex> UserManager.get_random_users()
      {:ok, []}

  """
  defdelegate get_random_users, to: UserManager
end

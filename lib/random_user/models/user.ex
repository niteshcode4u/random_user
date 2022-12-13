defmodule RandomUser.Models.User do
  @moduledoc """
  A module responsible for user CRUD operations.
  """

  import Ecto.Query, warn: false

  alias RandomUser.Repo
  alias RandomUser.Schemas.User

  @doc """
  Creates a multiple users at once.

  ## Examples

      iex> insert_all([%{field: value}])
      {number_of_records_interted, nil}

  """
  def insert_all(user_attrs_list) do
    Repo.insert_all(User, user_attrs_list)
  end

  @doc """
  Returns max two random users from database having points
  greater than min_number or returns an empty list

  ## Examples

      iex> get_random_users(min_number)
      [%User{}, %User{}]

      iex> get_random_users(min_number)
      []

  """
  def get_random_users(min_number) do
    user_query =
      from(
        u in User,
        where: u.points > ^min_number,
        order_by: fragment("RANDOM()"),
        limit: 2
      )

    Repo.all(user_query)
  end

  @doc """
  Update points value for all users at once

  ## Examples

      iex> update_all()
      {number_of_records_updated, nil}

  """
  def update_all do
    User
    |> update(set: [points: fragment("floor(random()*100)")])
    |> Repo.update_all([])
  end
end

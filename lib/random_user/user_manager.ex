defmodule RandomUser.UserManager do
  @moduledoc """
  Handle following few things
    1. Update every user's points in the database every minutes
    2. Refresh the min_number with a new random number every minutes
    3. Maintain timestamp for last query
    4. Revert 2 random user after few ops
  """

  use GenServer

  alias RandomUser.Models.User

  @interval_time 60

  # Client APIs #############################################################

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @spec get_random_users :: {:ok, list()}
  def get_random_users do
    GenServer.call(__MODULE__, :get_random_users)
  end

  # Call Handlers #############################################################

  @impl GenServer
  @spec init(any) :: {:ok, %{min_number: pos_integer, timestamp: nil}}
  def init(_opts) do
    @interval_time |> :timer.seconds() |> :timer.send_interval(:run_query)

    {:ok, %{min_number: get_random_num(), timestamp: nil}}
  end

  @impl GenServer
  def handle_info(:run_query, state) do
    User.update_all()

    {:noreply, Map.put(state, :min_number, get_random_num())}
  end

  @impl GenServer
  def handle_call(:get_random_users, _from, state) do
    results = %{
      users: User.get_random_users(state.min_number),
      timestamp: state.timestamp
    }

    {:reply, {:ok, results}, Map.put(state, :timestamp, get_current_time())}
  end

  # Private functions #############################################################

  defp get_random_num, do: Enum.random(0..100)
  defp get_current_time, do: NaiveDateTime.truncate(NaiveDateTime.utc_now(), :second)
end

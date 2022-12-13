defmodule RandomUser.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      RandomUser.Repo,
      # Start the UserManager
      RandomUser.UserManager,
      # Start the Telemetry supervisor
      RandomUserWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: RandomUser.PubSub},
      # Start the Endpoint (http/https)
      RandomUserWeb.Endpoint
      # Start a worker by calling: RandomUser.Worker.start_link(arg)
      # {RandomUser.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RandomUser.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

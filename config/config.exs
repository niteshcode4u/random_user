# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :random_user,
  ecto_repos: [RandomUser.Repo]

# Configures the endpoint
config :random_user, RandomUserWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RandomUserWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: RandomUser.PubSub,
  live_view: [signing_salt: "8JEGRtls"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

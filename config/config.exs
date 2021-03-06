# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :catrina,
  ecto_repos: [Catrina.Repo]

# Configures the endpoint
config :catrina, Catrina.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fvVaU9aMvaDr1QnoDEj+umYaekQZz+BEgi0otPNtBvuhpNq+cqNjTYy9RiRN+a74",
  render_errors: [view: Catrina.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Catrina.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Arc
config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

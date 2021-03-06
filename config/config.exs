# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :test_exadmin,
  ecto_repos: [TestExadmin.Repo]

# Configures the endpoint
config :test_exadmin, TestExadmin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xjQcEycsm7luIIFvQkdle240FUsGohDHLEcyuiuGSt7rQrhFZqm5KBkKlqgmGWkD",
  render_errors: [view: TestExadmin.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TestExadmin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ex_admin,
  repo: TestExadmin.Repo,
  module: TestExadmin,
  modules: [
    TestExadmin.ExAdmin.Dashboard,
    TestExadmin.ExAdmin.User,
    TestExadmin.ExAdmin.Role,
  ]
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}


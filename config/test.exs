use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :arena_connect_bot, ArenaConnectBotWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :tesla, adapter: Tesla.Mock

config :arena_connect_bot, ArenaConnectBot.Arena.Api,
  http_client: ArenaConnectBot.Arena.HttpClient

config :arena_connect_bot, ArenaConnectBot.Telegram.Api,
  http_client: ArenaConnectBot.Telegram.HttpClient


defmodule ArenaConnectBotWeb.Router do
  use ArenaConnectBotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ArenaConnectBotWeb do
    pipe_through :api

    # add new routes here under this scope
    post "/message", TelegramMessageInController, :index
  end
end

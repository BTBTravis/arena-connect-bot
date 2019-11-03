defmodule ArenaConnectBotWeb.TelegramMessageInController do
  use ArenaConnectBotWeb, :controller

  # method to handle all incoming telegram messages
  def index(conn, _params) do
    json(conn, %{handled: true})
    #render(conn, "index.html")
  end
end

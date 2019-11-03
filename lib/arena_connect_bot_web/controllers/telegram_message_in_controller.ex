defmodule ArenaConnectBotWeb.TelegramMessageInController do
  use ArenaConnectBotWeb, :controller
  #use ArenaConnectBot.IncomingMessage

  def send400(conn, msg) do
    conn
    |> put_status(400)
    |> json(%{reason: msg})
  end

  def get_chat_id(post_data) do
    get_in(post_data, ["message", "chat", "id"])
  end

  # method to handle all incoming telegram messages
  def index(conn, params) do
    #IO.inspect(params)
    case get_chat_id(params) do
      nil -> send400(conn, "no message found")
      chat_id -> json(conn, %{handled: true, chat_id: chat_id})
    end
  end
end

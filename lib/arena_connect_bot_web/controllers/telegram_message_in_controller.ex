defmodule ArenaConnectBotWeb.TelegramMessageInController do
  use ArenaConnectBotWeb, :controller
  #use ArenaConnectBot.IncomingMessage

  def send400(conn, msg) do
    conn
    |> put_status(400)
    |> json(%{reason: msg})
  end

  # method to handle all incoming telegram messages
  def index(conn, params) do
    #IO.inspect(params)
    case ArenaConnectBot.Bot.handle_incoming_msg(params) do
      {:error, msg} -> send400(conn, msg)
      _ -> json(conn, %{handled: true})
    end
  end
end

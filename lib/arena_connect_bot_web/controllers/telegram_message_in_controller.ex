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
    case Map.fetch(params, :message) do
      {:ok, msg} -> json(conn, %{handled: true, msg: msg})
      :error -> send400(conn, "no message found")
    end
    #Map.fetch(params, :message)
    #case Poison.decode!(params, as: %ArenaConnectBot.IncomingMessage{}) do
      #{:ok, msg}      -> IO.puts "decoded: #{msg}"
      #{:error, reason} -> IO.puts "Error"
    #end
    #msg = Poison.decode(params, as: %ArenaConnectBot.IncomingMessage{})
    #IO.inspect(params)
    # todo decode message and if it is not message return bad status 400
    #IO.inspect params
    #text(conn, Poison.encode!(%ArenaConnectBot.IncomingMessage{message_id: 88, from_id: 111, chat_id: 222, text: "hello world"}))
    #json(conn, %ArenaConnectBot.IncomingMessage{message_id: 88, from_id: 111, chat_id: 222, text: "hello world"})
    #json(conn, %{handled: true})
    #render(conn, "index.html")
  end
end

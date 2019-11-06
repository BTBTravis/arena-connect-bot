defmodule ArenaConnectBot.Telegram do
  alias ArenaConnectBot.Telegram.Api, as: Api

  def get_token() do
    Application.get_env(:arena_connect_bot, ArenaConnectBot.Telegram.Api)[:token]
  end

  def send_message_to_chat(chat_id, msg) do
    Api.client(get_token())
    |> Api.send_msg(chat_id, msg)
  end
end


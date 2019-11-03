defmodule ArenaConnectBot.Telegram.Api do
  use Tesla

  adapter Tesla.Adapter.Hackney, recv_timeout: 30_000

  def send_msg(token, chat_id, msg) do
    url = "https://api.telegram.org/bot" <> token <> "/sendMessage"
    json_data = Jason.encode!(%{"text" => msg, "chat_id" => chat_id})
    p = Tesla.post(url, json_data, headers: [{"content-type", "application/json"}])
    IO.inspect p
  end
end

defmodule ArenaConnectBot.Telegram.Api do

  @http_client Application.get_env(:arena_connect_bot, ArenaConnectBot.Telegram.Api)[:http_client]

  def send_msg(client, chat_id, msg) do
    url = "/sendMessage"
    @http_client.post(client, url, %{"text" => msg, "chat_id" => chat_id})
  end

  def client(token) do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.telegram.org/bot" <> token},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger
    ]

    Tesla.client(middleware)
  end
end

defmodule ArenaConnectBot.Telegram.Api do
  def send_msg(token, chat_id, msg) do
    # pass `client` argument to `Tesla.get` function
    url = "https://api.telegram.org/bot" <> token <> "/sendMessage"
    #Tesla.post(client, url, %{"text" => msg, "chat_id" => chat_id})
    #Tesla.post(url, %{"text" => msg, "chat_id" => chat_id}, headers: [{"content-type", "application/json"}])
    Tesla.post(url, "data", headers: [{"content-type", "application/json"}])
  end

  # build dynamic client based on runtime arguments
  #def client() do
    #middleware = [
      #{Tesla.Middleware.BaseUrl, "https://api.telegram.org"},
      #Tesla.Middleware.JSON
    #]

    #Tesla.client(middleware)
  #end
end

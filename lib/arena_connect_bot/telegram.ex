defmodule ArenaConnectBot.Telegram do
  def send_message_to_chat(chat_id, msg) do
    #client = ArenaConnectBot.Telegram.Api.client()
    case System.get_env("TELEGRAM_TOKEN") do
      nil -> {:error, "missing TELEGRAM_TOKEN env var"}
      token -> ArenaConnectBot.Telegram.Api.send_msg("lalal", chat_id, msg)
    end
  end
end

#curl -X POST -H 'Content-type: application/json' \
#--data '{"text":"hello good sir", "chat_id": 953058570 }' \
#https://api.telegram.org/bot962619911:AAEswPv6hz3D28scl2yZSx_5vwRF4M7rDFg/sendMessage




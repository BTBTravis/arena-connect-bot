defmodule ArenaConnectBot.Bot do
  def get_chat_id(post_data) do
    get_in(post_data, ["message", "chat", "id"])
  end

  def get_msg_text(post_data) do
    get_in(post_data, ["message", "text"])
  end

  def handle_incoming_msg(raw_post_data) do
    chat_id = get_chat_id(raw_post_data)
    txt = get_msg_text(raw_post_data)
    # todo validate txt

    if chat_id != nil and txt != nil do
        ArenaConnectBot.Telegram.send_message_to_chat(chat_id, "well hi there")
    else
      {:error, "url and chat_id not found"}
    end
  end
end

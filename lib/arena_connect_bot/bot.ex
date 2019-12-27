defmodule ArenaConnectBot.Bot do
  alias ArenaConnectBot.Arena
  alias ArenaConnectBot.Telegram

  @doc """
  Gets an message id int from a telegram update
  Returns `{:ok, 1234}`.
  """
  defp get_chat_id(post_data) do
    case get_in(post_data, ["message", "chat", "id"]) do
      nil -> {:error, "no chat id found"}
      id -> {:ok, id}
    end
  end

  defp get_msg_text(post_data) do
    case get_in(post_data, ["message", "text"]) do
      nil -> {:warning, "can't find message txt in your message"}
      txt -> {:ok , txt}
    end
  end

  defp get_user_id(post_data) do
    case get_in(post_data, ["message", "from", "id"]) do
      nil -> {:warning, "can't find user id in your message"}
      id -> {:ok, id}
    end
  end

  defp get_url_from_txt(txt) do
    case String.match?(txt, ~r/^http[^\s]*$/) do
      true -> {:ok, txt}
      false -> {:warning, "no url found, please only send url for now"}
    end
  end

  defp save_link(msg) do
    case get_url_from_txt(msg.txt) do
      {:ok, url} ->
        with {:ok, _} <- Arena.save_block_to_incoming(url),
             {:ok, _} <- Telegram.send_message_to_chat(msg.chat_id, "saved link to Are.na")
        do
          {:ok, "url saved to Aren.na"}
        end
      err -> err
    end
  end

  defp extact_data(raw_data) do
    with {:ok, user_id} <- get_user_id(raw_data),
	 {:ok, txt} <- get_msg_text(raw_data),
	 {:ok, _} <- validate_is_admin(user_id)
    do
      {:ok, %{user_id: user_id, txt: txt}}
    end
  end

  defp parse_msg(raw_data, chat_id) do
    case extact_data(raw_data) do
      {:ok, msg} -> save_link(Map.put(msg, :chat_id, chat_id))
      {:warning, warning_msg} -> Telegram.send_message_to_chat(chat_id, warning_msg)
      _ -> raw_data
    end
  end

  def handle_incoming_msg(raw_data) do
    case get_chat_id(raw_data) do
      {:ok, chat_id} -> parse_msg(raw_data, chat_id)
      x -> IO.inspect x
    end
  end

  defp validate_is_admin(id) do
    if Telegram.get_admin_user_id() == "#{id}" do
      {:ok, id}
    else
      {:warning, "not admin"}
    end
  end
end

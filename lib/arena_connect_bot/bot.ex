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

  defp save_link(raw_post_data) do
    with {:ok, chat_id} <- get_chat_id(raw_post_data),
         {:ok, txt} <- get_msg_text(raw_post_data),
         {:ok, user_id} <- get_user_id(raw_post_data)
    do
      case get_url_from_txt(txt) do
        {:ok, url} ->
          with {:ok, _} <- Arena.save_block_to_incoming(url),
               {:ok, _} <- Telegram.send_message_to_chat(chat_id, "saved link to Are.na")
          do
            {:ok, "url saved to Aren.na"}
          end
        err -> err
      end
    end
  end

  def handle_incoming_msg(data) do
    with {:ok, chat_id} <- get_chat_id(data),
         {:warning, warning_txt} <- save_link(data)
    do
      Telegram.send_message_to_chat(chat_id, "problem saving link: " <> warning_txt)
    end
  end
end

defmodule ArenaConnectBot.Arena do
  alias ArenaConnectBot.Arena.Api, as: Api

  def get_token() do
    Application.get_env(:arena_connect_bot, ArenaConnectBot.Arena)[:token]
  end

  def get_incoming_channel_slug() do
    Application.get_env(:arena_connect_bot, ArenaConnectBot.Arena)[:incoming_channel]
  end

  def save_block_to_incoming(url) do
    Api.client(get_token())
    |> Api.create_block(get_incoming_channel_slug(), url)
  end
end


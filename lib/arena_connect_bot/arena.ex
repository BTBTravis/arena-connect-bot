defmodule ArenaConnectBot.Arena do
  alias ArenaConnectBot.Arena.Api, as: Api

  def get_token() do
    Application.get_env(:arena_connect_bot, ArenaConnectBot.Arena)[:token]
  end

  def save_block_to_incoming(url) do
    Api.client(get_token())
    |> Api.create_block("incoming-ubmwovuwmgm", url)
  end
end


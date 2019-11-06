defmodule ArenaConnectBot.Arena.Api do
  alias ArenaConnectBot.Arena.Channel

  @http_client Application.get_env(:arena_connect_bot, ArenaConnectBot.Arena.Api)[:http_client]

  def get_channels(client, user_id) do
    # TODO: add limit
    case Tesla.get(client, "/users/" <> user_id <> "/channels") do
      {:ok, res} -> get_in(res.body(), ["channels"]) |> Stream.map(&%Channel{title: &1["title"], slug: &1["slug"]}) |> Enum.to_list
      a -> a
    end
  end

  def create_block(client, slug, block_url) do
    url = "/channels/" <> slug <> "/blocks"
    @http_client.post(client, url, %{"source" => block_url})
  end

  def client(token) do
    middleware = [
      {Tesla.Middleware.Headers, [{"Authorization", "Bearer " <> token }]},
      {Tesla.Middleware.BaseUrl, "https://api.are.na/v2"},
      Tesla.Middleware.JSON,
      Tesla.Middleware.Logger
    ]

    Tesla.client(middleware)
  end
end


defmodule ArenaConnectBotWeb.TelegramMessageInControllerTest do
    #use ExUnit.Case
    use ArenaConnectBotWeb.ConnCase

    import Tesla.Mock

    setup do
      token = System.get_env("TELEGRAM_TOKEN")
      telegram_send_msg_url = "https://api.telegram.org/bot" <> token <> "/sendMessage"
      mock fn
        %{method: :post, url: telegram_send_msg_url } ->
          %Tesla.Env{status: 200, body: "hello"}
        #%{method: :post, url: "http://example.com/world"} ->
          #json(%{"my" => "data"})
      end

      :ok
    end

    test "/api/message only accepts valid messages", %{conn: conn} do
        msg = %{
          "message" => nil
        }
      conn = post(conn, "/api/message", msg)
      assert json_response(conn, 400)
      #assert json_response(conn, 200) == %{"handled" => true}
    end

    test "/api/message accepts valid message", %{conn: conn} do
      msg = %{
        "message" => %{
          "chat" => %{
            "first_name" => "Travis",
            "id" => 953058570,
            "last_name" => "Shears",
            "type" => "private"
          },
          "date" => 1572799466,
          "entities" => [%{"length" => 47, "offset" => 0, "type" => "url"}],
          "from" => %{
            "first_name" => "Travis",
            "id" => 953058570,
            "is_bot" => false,
            "language_code" => "en",
            "last_name" => "Shears"
          },
          "message_id" => 3,
          "text" => "https://hexdocs.pm/phoenix/testing.html#content"
        },
        "update_id" => 217220855
      }
      conn = post(conn, "/api/message", msg)
      #assert json_response(conn, 400)
      assert json_response(conn, 200) == %{"handled" => true}
    end
end




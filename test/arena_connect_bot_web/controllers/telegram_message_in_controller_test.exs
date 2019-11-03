defmodule ArenaConnectBotWeb.TelegramMessageInControllerTest do
    use ArenaConnectBotWeb.ConnCase

    test "POST /api/message", %{conn: conn} do
          conn = post(conn, "/api/message")
          assert json_response(conn, 200) == %{"handled" => true}
    end
end

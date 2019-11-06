defmodule ArenaConnectBot.BotTest do
  use ExUnit.Case
  doctest ArenaConnectBot.Bot

  alias ArenaConnectBot.Bot, as: Bot

  test "handles missing chat id" do
    res = Bot.handle_incoming_msg(%{})
    assert res == {:error, "no chat id found"}
  end

  test "handles missing user id" do
    res = Bot.handle_incoming_msg(
      %{"message" =>
        %{
          "text" => "http://www.test.com",
          "chat" => %{"id" => 1234}
        }
      }
    )
    assert res == {:ok, %{"chat_id" => 1234, "text" => "problem saving link: can't find user id in your message"}}
  end

  test "handles missing message text" do
    res = Bot.handle_incoming_msg(
      %{"message" =>
        %{
          "chat" => %{"id" => 1234},
          "from" => %{"id" => 1234}
        }
      }
    )
    assert res == {:ok, %{"chat_id" => 1234, "text" => "problem saving link: can't find message txt in your message"}}
  end

  test "handles no url in message" do
    res = Bot.handle_incoming_msg(
      %{"message" =>
        %{
          "chat" => %{"id" => 1234},
          "from" => %{"id" => 1234},
          "text" => "tweet: http://www.twitter.com"
        }
      }
    )
    assert res == {:ok, %{"chat_id" => 1234, "text" => "problem saving link: no url found, please only send url for now"}}
  end

  test "saves block" do
    res = Bot.handle_incoming_msg(
      %{"message" =>
        %{
          "chat" => %{"id" => 1234},
          "from" => %{"id" => 1234},
          "text" => "http://www.twitter.com"
        }
      }
    )
    assert res ==  {:ok, "url saved to Aren.na"}
  end
end


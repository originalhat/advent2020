defmodule CustomsTest do
  use ExUnit.Case
  doctest Customs

  test "greets the world" do
    assert Customs.hello() == :world
  end
end

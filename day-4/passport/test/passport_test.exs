defmodule PassportTest do
  use ExUnit.Case
  doctest Passport

  test "greets the world" do
    assert Passport.hello() == :world
  end
end

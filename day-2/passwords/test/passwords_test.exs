defmodule PasswordsTest do
  use ExUnit.Case
  doctest Passwords

  test "greets the world" do
    assert Passwords.hello() == :world
  end
end

defmodule PasswordsTest do
  use ExUnit.Case
  doctest Passwords

  test "validates a password against it's policy" do
    assert Passwords.is_valid?(%{
             :character => ?a,
             :min => 1,
             :max => 3,
             :password => "abcde"
           }) == true

    assert Passwords.is_valid?(%{
             :character => ?b,
             :min => 1,
             :max => 3,
             :password => "cdefg"
           }) == false

    assert Passwords.is_valid?(%{
             :character => ?c,
             :min => 2,
             :max => 9,
             :password => "ccccccccc"
           }) == true
  end
end

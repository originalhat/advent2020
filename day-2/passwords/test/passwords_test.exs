defmodule PasswordsTest do
  use ExUnit.Case
  doctest Passwords

  test "validates a password against it's policy" do
    assert Passwords.is_valid?(%{
             :character => 97,
             :min => 1,
             :max => 3,
             :password => "abcde"
           }) == true

    assert Passwords.is_valid?(%{
             :character => 98,
             :min => 1,
             :max => 3,
             :password => "cdefg"
           }) == false

    assert Passwords.is_valid?(%{
             :character => 99,
             :min => 2,
             :max => 9,
             :password => "ccccccccc"
           }) == true
  end

  test "pretty parse" do
    assert Passwords.pretty_parse(["1-7", "l:", "clllllzlllllll"]) ==
             %{
               :min => 1,
               :max => 7,
               :character => 108,
               :password => "clllllzlllllll"
             }
  end
end

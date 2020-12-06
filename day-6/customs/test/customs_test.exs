defmodule CustomsTest do
  use ExUnit.Case
  doctest Customs

  test "return the correct # per party " do
    assert Customs.uniq_row_count(["abcx", "abcy", "abcz"]) == 6
  end
end

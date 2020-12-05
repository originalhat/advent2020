defmodule BinaryTest do
  use ExUnit.Case
  doctest Binary

  test "greets the world" do
    assert Binary.hello() == :world
  end
end

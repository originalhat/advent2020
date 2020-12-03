defmodule SleddingTest do
  use ExUnit.Case
  doctest Sledding

  test "greets the world" do
    assert Sledding.hello() == :world
  end
end

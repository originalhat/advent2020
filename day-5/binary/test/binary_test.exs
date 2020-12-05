defmodule BinaryTest do
  use ExUnit.Case
  doctest Binary

  test "splits row and seat" do
    assert Binary.split_code("BFFFFBBRLL") == {"BFFFFBB", "RLL"}
  end

  test "converts to row number" do
    assert Binary.to_b10("BFFFBBF") == 70
    assert Binary.to_b10("FFFBBBF") == 14
    assert Binary.to_b10("BBFFBBF") == 102
  end

  test "converts to seat number" do
    assert Binary.to_b10("RRR") == 7
    assert Binary.to_b10("RRR") == 7
    assert Binary.to_b10("RLL") == 4
  end

  test "convert to seat ID" do
    assert Binary.seat_id([70, 7]) == 567
    assert Binary.seat_id([14, 7]) == 119
    assert Binary.seat_id([102, 4]) == 820
  end

  test "converts a boarding passe to seat ID" do
    assert Binary.to_seat_id({"BFFFBBF", "RRR"}) == 567
  end

  test "finds the highest seat ID in the file data" do
    assert Binary.find_highest() == 998
  end

  test "finds the missing seat" do
    assert Binary.find_missing() == [676]
  end
end

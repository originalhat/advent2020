defmodule Passwords do
  def is_valid?(item) do
    item.password
    |> String.to_charlist()
    |> Enum.count(fn x -> x == item.character end)
    |> in_bounds(item.min, item.max)
  end

  def in_bounds(actual, min, max) do
    actual >= min and actual <= max
  end
end

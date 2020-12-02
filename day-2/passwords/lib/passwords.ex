defmodule Passwords do
  def parse_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, " ", trim: true) end)
    |> Enum.map(&pretty_parse(&1))
  end

  def is_valid?(item) do
    item.password
    |> String.to_charlist()
    |> Enum.count(fn x -> x == item.character end)
    |> in_bounds(item.min, item.max)
  end

  def in_bounds(actual, min, max) do
    actual >= min and actual <= max
  end

  def pretty_parse(x) do
    %{
      :min => min_count(Enum.at(x, 0)),
      :max => max_count(Enum.at(x, 0)),
      :character => character(Enum.at(x, 1)),
      :password => Enum.at(x, 2)
    }
  end

  defp min_count(x) do
    x
    |> String.split("-")
    |> Enum.at(0)
    |> String.to_integer()
  end

  defp max_count(x) do
    x
    |> String.split("-")
    |> Enum.at(1)
    |> String.to_integer()
  end

  defp character(x) do
    x |> String.split(":") |> Enum.at(0) |> to_charlist() |> hd
  end
end

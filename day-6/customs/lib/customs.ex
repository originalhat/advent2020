defmodule Customs do
  def load_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split(~r{\n\s}, trim: true)
    |> Enum.map(&String.replace(&1, "\n", " "))
    |> Enum.map(&String.split(&1, " ", trim: true))
  end

  def uniq_row_count(row) do
    row
    |> Enum.map(&MapSet.new(String.to_charlist(&1)))
    |> Enum.reduce(fn x, acc -> MapSet.intersection(acc, x) end)
    |> Enum.count()
  end

  def total_count() do
    Customs.load_file()
    |> Enum.reduce(0, fn x, acc -> acc + Customs.uniq_row_count(x) end)
  end
end

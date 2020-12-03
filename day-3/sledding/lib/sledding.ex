defmodule Sledding do
  def parse_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
  end

  def how_many_trees(hill, x_multiplier \\ 1, y_multiplier \\ 3) do
    hill
    |> Enum.with_index()
    |> Enum.count(fn {row, i} ->
      y = rem(i * y_multiplier, 31)
      access_loc(row, y) |> is_tree?
    end)
  end

  defp access_loc(list, y) do
    Enum.at(list, y)
  end

  defp is_tree?(char) do
    char == "#"
  end
end

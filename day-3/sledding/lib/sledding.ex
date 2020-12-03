defmodule Sledding do
  def parse_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.split(x, "", trim: true) end)
  end

  def how_many_trees(hill) do
    y_increment = 3

    hill
    |> Enum.with_index()
    |> Enum.count(fn {row, i} ->
      access_loc(row, rem(i * y_increment, 31)) |> is_tree?
    end)
  end

  defp access_loc(list, y) do
    Enum.at(list, y)
  end

  defp is_tree?(char) do
    char == "#"
  end
end

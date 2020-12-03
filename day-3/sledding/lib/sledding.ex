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
    |> Enum.count(fn {_row, i} ->
      x = i * x_multiplier
      y = rem(i * y_multiplier, 31)

      case x < Enum.count(hill) do
        true -> access_loc(hill, x, y) |> is_tree?
        _ -> false
      end
    end)
  end

  defp access_loc(list, x, y) do
    Enum.at(list, x) |> Enum.at(y)
  end

  defp is_tree?(char) do
    char == "#"
  end
end

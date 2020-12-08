defmodule Bags do
  def count_bags(nodes, t) do
    count_nodes(nodes, t) |> List.flatten() |> MapSet.new() |> Enum.count()
  end

  def count_nodes(nodes, t, acc \\ []) do
    parents = find_parents(nodes, t)
    count = Enum.count(parents)

    case count do
      0 ->
        acc

      _ ->
        Enum.into(parents, [], fn parent ->
          count_nodes(nodes, parent, acc ++ [parent])
        end)
    end
  end

  def find_parents(nodes, t) do
    nodes
    |> Enum.filter(&Enum.find(elem(&1, 1), fn z -> z == t end))
    |> Enum.map(fn x -> elem(x, 0) end)
  end

  def read_file() do
    File.read!("input.txt")
    |> String.split("\n", true: true)
    |> Enum.map(&String.split(&1, ~r/( bags contain |\d | bags?,? ?\.?)/, trim: true))
    |> Enum.map(
      &Enum.map(&1, fn x ->
        String.to_atom(String.replace(x, " ", "_"))
      end)
    )
    |> Enum.into(%{}, fn [h | t] -> {h, t} end)
  end
end

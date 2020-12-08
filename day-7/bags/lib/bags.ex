defmodule Bags do
  def count_bags(nodes, t) do
    count_nodes(nodes, t)
    |> List.flatten()
    |> Enum.count()
  end

  def count_nodes(nodes, t, acc \\ 0) do
    parents = find_parents(nodes, t)
    count = Enum.count(parents)

    case count do
      0 -> acc
      _ -> Enum.map(parents, &count_nodes(nodes, &1, acc + count))
    end
  end

  def find_parents(nodes, t) do
    nodes
    |> Enum.filter(&Enum.find(elem(&1, 1), fn z -> z == t end))
    |> Enum.map(fn x -> elem(x, 0) end)
  end
end

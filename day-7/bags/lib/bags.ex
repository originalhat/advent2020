defmodule Bags do
  def count_bags(nodes, t) do
    count_nodes(nodes, t)
    |> List.flatten()
    |> Enum.count()
  end

  def count_nodes(nodes, t, acc \\ 0) do
    count = Enum.count(find_parents(nodes, t))

    case count do
      0 ->
        acc

      _ ->
        Enum.map(find_parents(nodes, t), fn parent ->
          count_nodes(nodes, parent, acc + count)
        end)
    end
  end

  def find_parents(nodes, t) do
    Enum.filter(nodes, fn x ->
      Enum.find(elem(x, 1), fn z -> z == t end)
    end)
    |> Enum.map(fn x -> elem(x, 0) end)
  end
end

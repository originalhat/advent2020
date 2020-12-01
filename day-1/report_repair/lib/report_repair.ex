defmodule ReportRepair do
  # def sum_to([], _target) do: []

  def magic_product(list, target) do
    for x <- list do
      for y <- list do
        if sum_to?(x, y, target) do
          [x, y]
        else
          nil
        end
      end
    end
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
    |> Enum.slice(0..1)
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  defp sum_to?(x, y, target) do
    x + y == target
  end
end

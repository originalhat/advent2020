defmodule ReportRepair do
  # def sum_to([], _target) do: []

  def magic_product(list, target) do
    for x <- list do
      for y <- list do
        for z <- list do
          if sum_to?(x, y, z, target) do
            [x, y, z]
          else
            nil
          end
        end
      end
    end
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
    |> Enum.slice(0..2)
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  defp sum_to?(x, y, z, target) do
    x + y + z == target
  end
end

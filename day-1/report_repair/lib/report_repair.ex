defmodule ReportRepair do
  # def sum_to([], _target) do: []

  def magic_product(list, target) do
    for x <- list do
      case any_comp?(list, target - x) do
        true ->
          [x, target - x]

        _ ->
          nil
      end
    end
    |> Enum.reject(&is_nil/1)
    |> List.first()
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  defp any_comp?(list, comp) do
    Enum.any?(list, fn x -> x == comp end)
  end
end

defmodule Passport do
  def parse_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split(~r{\n\s}, trim: true)
    |> Enum.map(&String.replace(&1, "\n", " "))
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(
      &Enum.into(&1, %{}, fn x ->
        [k, v] = String.split(x, ":")
        {String.to_atom(k), v}
      end)
    )
  end

  def is_valid?(passport) do
    [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
    |> Enum.map(&Map.has_key?(passport, &1))
    |> Enum.reduce(fn x, acc -> x and acc end)
  end

  def num_valid_passports(passports) do
    passports
    |> Enum.count(&is_valid?/1)
  end
end

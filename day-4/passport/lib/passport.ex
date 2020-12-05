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
    # |> Enum.map(&Map.has_key?(passport, &1))
    |> Enum.map(fn x ->
      case x do
        :byr -> passport[:byr] != nil and valid_byr?(String.to_integer(passport[:byr]))
        :iyr -> passport[:iyr] != nil and valid_iyr?(String.to_integer(passport[:iyr]))
        :eyr -> passport[:eyr] != nil and valid_eyr?(String.to_integer(passport[:eyr]))
        :hgt -> passport[:hgt] != nil and valid_hgt?(passport[:hgt])
        :hcl -> passport[:hcl] != nil and valid_hcl?(passport[:hcl])
        :ecl -> passport[:ecl] != nil and valid_ecl?(passport[:ecl])
        :pid -> passport[:pid] != nil and valid_pid?(passport[:pid])
        _ -> false
      end
    end)
    |> Enum.reduce(fn x, acc -> x and acc end)
  end

  def num_valid_passports(passports) do
    passports
    |> Enum.count(&is_valid?/1)
  end

  def valid_byr?(byr), do: byr >= 1920 and byr <= 2002

  def valid_iyr?(iyr), do: iyr >= 2010 and iyr <= 2020

  def valid_eyr?(eyr), do: eyr >= 2020 and eyr <= 2030

  def valid_hgt?(hgt) do
    val = String.to_integer(Enum.at(String.split(hgt, ~r/\D+/, trim: true), 0))

    case Enum.at(String.split(hgt, ~r/\d+/, trim: true), 0) do
      "cm" ->
        val >= 150 and val <= 193

      "in" ->
        val >= 59 and val <= 76

      _ ->
        false
    end
  end

  def valid_hcl?(hcl), do: Regex.match?(~r/#([A-Fa-f0-9]{6})/, hcl)

  def valid_ecl?("amb"), do: true
  def valid_ecl?("blu"), do: true
  def valid_ecl?("brn"), do: true
  def valid_ecl?("gry"), do: true
  def valid_ecl?("grn"), do: true
  def valid_ecl?("hzl"), do: true
  def valid_ecl?("oth"), do: true
  def valid_ecl?(_), do: false

  def valid_pid?(pid), do: Regex.match?(~r/^\d{9}$/, pid)
end

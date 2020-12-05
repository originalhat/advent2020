defmodule Binary do
  def split_code(code), do: code |> String.split_at(7)

  def to_b10(bin) do
    bin
    |> String.replace(~r/F|L/, "0")
    |> String.replace(~r/B|R/, "1")
    |> Integer.parse(2)
    |> elem(0)
  end

  def seat_id(seat) do
    Enum.at(seat, 0) * 8 + Enum.at(seat, 1)
  end

  def to_seat_id(boarding_passe) do
    seat_id([to_b10(elem(boarding_passe, 0)), to_b10(elem(boarding_passe, 1))])
  end

  def load_file() do
    {:ok, contents} = File.read("input.txt")

    contents
    |> String.split(~r/\n/, trim: true)
  end

  def find_highest() do
    boarding_passes = Binary.load_file()

    boarding_passes
    |> Enum.map(&Binary.split_code(&1))
    |> Enum.map(&Binary.to_seat_id(&1))
    |> Enum.max()
  end

  def find_missing() do
    boarding_passes = Binary.load_file()

    boarding_passes
    |> Enum.map(&Binary.split_code(&1))
    |> Enum.map(&Binary.to_seat_id(&1))
    |> (&(Enum.to_list(38..998) -- &1)).()
  end
end

# 38..396

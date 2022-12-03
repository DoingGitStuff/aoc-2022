defmodule ElixirAoc.Three do
  def input_file(), do: "3.txt"
  def solve(input) do
    input
    |> String.split("\n")
    |> Enum.map(&find_dup/1)
    |> Enum.map(&priority/1)
    |> Enum.sum()
  end

  def priority(c) when ?a <= c and c <= ?z, do: c - 96
  def priority(c) when ?A <= c and c <= ?Z, do: c - 38

  def find_dup(str) when is_bitstring(str) do
    chars = String.to_charlist(str)
    {first, second} = Enum.split(chars, div(length(chars), 2))

    MapSet.intersection(MapSet.new(first), MapSet.new(second))
    |> MapSet.to_list()
    |> hd()
  end

  def find_dup([a, a | _rest]), do: a
  def find_dup([_ | rest]), do: find_dup(rest)
end

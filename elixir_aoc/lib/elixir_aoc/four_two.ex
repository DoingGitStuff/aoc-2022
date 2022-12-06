defmodule ElixirAoc.FourTwo do
  def input_file(), do: "4.txt"

  def solve(input) do
    input
    |> String.split("\n")
    |> Enum.map(&ElixirAoc.Four.parse_line/1)
    |> Enum.count(&overlaps/1)
  end

  def overlaps({a1, a2, b1, b2}) do
    MapSet.intersection(MapSet.new(a1..a2), MapSet.new(b1..b2))
    |> MapSet.to_list()
    |> length()
    |> (fn x -> x != 0 end).()
  end
end

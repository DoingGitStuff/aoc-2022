defmodule ElixirAoc.FourTwo do
  def input_file(), do: "4.txt"

  def solve(input) do
    input
    |> String.split("\n")
    |> Enum.map(&ElixirAoc.Four.parse_line/1)
    |> Enum.count(&overlaps/1)
  end

  def overlaps({a1,a2,b1,b2}) do
    (a2 >= b1) or (a1 >= b2)
  end
end

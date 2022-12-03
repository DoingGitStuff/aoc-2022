defmodule ElixirAoc.One do
  def input_file(), do: "1.txt"

  def solve(input) do
    sums(input)
    |> Enum.max()
  end

  def items(input) when is_bitstring(input) do
    String.split(input, "\n")
    |> Enum.map(&Integer.parse(&1))
    |> Enum.map(fn {a, _b} -> a end)
  end

  def sums(input) do
    for group <- String.split(input, "\n\n") do
      group
      |> items()
      |> Enum.sum()
    end
  end
end

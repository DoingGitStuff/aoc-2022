defmodule ElixirAoc.Onetwo do
  def input_file(), do: "1.txt"

  def solve(input) when is_bitstring(input) do
    ElixirAoc.One.sums(input) |> :lists.sort() |> :lists.reverse() |> Enum.take(3) |> Enum.sum()
  end
end

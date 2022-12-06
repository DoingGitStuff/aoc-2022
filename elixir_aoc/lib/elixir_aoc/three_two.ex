defmodule ElixirAoc.ThreeTwo do
  def input_file(), do: "3.txt"

  def solve(input) do
    input
    |> String.split("\n")
    |> group_lines()
    |> Enum.map(&group_item/1)
    |> Enum.map(&ElixirAoc.Three.priority/1)
    |> Enum.sum()
  end

  def group_lines(lines, acc \\ [])

  def group_lines([a, b, c | rest], acc) do
    group_lines(rest, [[a, b, c] | acc])
  end

  def group_lines([], acc), do: acc

  def group_item(group) do
    group
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&MapSet.new/1)
    |> Enum.reduce(&MapSet.intersection/2)
    |> MapSet.to_list()
    |> hd()
  end
end

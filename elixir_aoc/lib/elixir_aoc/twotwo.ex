defmodule ElixirAoc.Twotwo do
  def input_file(), do: "2.txt"

  def solve(input) do
    input
    |> ElixirAoc.Two.split()
    |> Enum.map(fn [a, b] -> [ElixirAoc.Two.parse(a), b] end)
    |> Enum.map(&apply(__MODULE__, :resolve, &1))
    |> Enum.map(fn x -> apply(&ElixirAoc.Two.score/2, x) end)
    |> Enum.sum()
  end

  def resolve(opponent, target) do
    [:rock, :paper, :scissors]
    |> Enum.find(fn hand -> ElixirAoc.Two.rps(hand, opponent) == parse(target) end)
    |> (fn hand -> [hand, opponent] end).()
  end

  def parse("X"), do: :right
  def parse("Y"), do: :draw
  def parse("Z"), do: :left
end

defmodule ElixirAoc.Two do
  def input_file(), do: "2.txt"

  def solve(input) do
    input
    |> split()
    |> Enum.map(&:lists.reverse/1)
    |> Enum.map(fn x -> Enum.map(x, &parse/1) end)
    |> Enum.map(fn x -> apply(&score/2, x) end)
    |> Enum.sum()
  end

  def split(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
  end

  @spec rps(:paper | :rock | :scissors, :paper | :rock | :scissors) :: :draw | :left | :right
  def rps(:rock, :paper), do: :right
  def rps(:paper, :scissors), do: :right
  def rps(:scissors, :rock), do: :right
  def rps(a, a), do: :draw
  def rps(_a, _b), do: :left

  @spec score(:paper | :rock | :scissors, :paper | :rock | :scissors) ::
          0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 12
  def score(a, b) do
    score(a) + (rps(a, b) |> score())
  end

  @spec score(:draw | :left | :paper | :right | :rock | :scissors) :: 0 | 1 | 2 | 3 | 6
  def score(:rock), do: 1
  def score(:paper), do: 2
  def score(:scissors), do: 3
  def score(:right), do: 0
  def score(:draw), do: 3
  def score(:left), do: 6

  def parse("A"), do: :rock
  def parse("B"), do: :paper
  def parse("C"), do: :scissors
  def parse("X"), do: :rock
  def parse("Y"), do: :paper
  def parse("Z"), do: :scissors
end

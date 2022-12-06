defmodule ElixirAoc.Four do
  def input_file(), do: "4.txt"

  def solve(input) do
    input
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.count(&is_inclusive/1)
  end

  def parse_line(input) do
    # parser combinators belong here
    {a1, "-" <> r1} = Integer.parse(input)
    {a2, "," <> r2} = Integer.parse(r1)
    {b1, "-" <> r3} = Integer.parse(r2)
    {b2, _} = Integer.parse(r3)
    {a1, a2, b1, b2}
  end

  def is_inclusive({a1, a2, b1, b2}),
    do: (a1 <= b1 and b2 <= a2) or (b1 <= a1 and a2 <= b2)
end

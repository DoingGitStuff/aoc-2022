defmodule ElixirAoc.OneTest do
  use ExUnit.Case
  doctest ElixirAoc.One
  @example """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """ |> String.trim()
  @example_solution 24000


  test "passes example given" do
    assert ElixirAoc.One.solve(@example) == @example_solution
  end

  test "sums does maths" do
    assert ElixirAoc.One.sums(@example) == [
      6000,
      4000,
      11000,
      24000,
      10000
    ]
  end
end

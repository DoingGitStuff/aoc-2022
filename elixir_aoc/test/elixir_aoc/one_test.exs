defmodule ElixirAocTest.One do
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
           """
           |> String.trim()
  @example_solution 24_000

  test "passes example given" do
    assert ElixirAoc.One.solve(@example) == @example_solution
  end

  test "sums does maths" do
    assert ElixirAoc.One.sums(@example) == [
             6000,
             4000,
             11_000,
             24_000,
             10_000
           ]
  end
end

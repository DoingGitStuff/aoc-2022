defmodule ElixirAocTest.Onetwo do
  use ExUnit.Case

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
  @example_solution 45_000


  test "passes example given" do
    assert ElixirAoc.Onetwo.solve(@example) == @example_solution
  end
end

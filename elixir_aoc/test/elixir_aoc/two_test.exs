defmodule ElixirAocTest.Two do
  use ExUnit.Case

  @example """
  A Y
  B X
  C Z
  """ |> String.trim()

  @example_solution 15



  test "example is solved" do
    assert ElixirAoc.Two.solve(@example) == @example_solution
  end
end

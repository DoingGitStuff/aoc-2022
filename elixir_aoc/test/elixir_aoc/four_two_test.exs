defmodule ElixirAoc.FourTwoTest do
  use ExUnit.Case


  @example """
  2-4,6-8
  2-3,4-5
  5-7,7-9
  2-8,3-7
  6-6,4-6
  2-6,4-8
  """ |> String.trim()

  @example_solution 4
  alias ElixirAoc.FourTwo
  test "sovles example" do
    assert FourTwo.solve(@example) == @example_solution
  end
end

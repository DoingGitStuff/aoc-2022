defmodule ElixirAocTest.TwoTwo do
  use ExUnit.Case

  @example """
           A Y
           B X
           C Z
           """
           |> String.trim()

  @example_solution 12

  test "solves example" do
    assert ElixirAoc.Twotwo.solve(@example) == @example_solution
  end

  test "resolve" do
    assert ElixirAoc.Twotwo.resolve(:rock, "X") == [:scissors, :rock]
    assert ElixirAoc.Twotwo.resolve(:rock, "Y") == [:rock, :rock]
    assert ElixirAoc.Twotwo.resolve(:rock, "Z") == [:paper, :rock]

    assert ElixirAoc.Twotwo.resolve(:paper, "X") == [:rock, :paper]
  end

  test "score" do
    assert ElixirAoc.Two.score(:rock, :rock) == 4
    assert ElixirAoc.Two.score(:rock, :paper) == 1
  end

  test "whole" do
    splitted =
      @example
      |> ElixirAoc.Two.split()

    assert splitted = [
             ["A", "Y"],
             ["B", "X"],
             ["C", "Z"]
           ]
  end
end

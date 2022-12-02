defmodule ElixirAocTest.Two do
  use ExUnit.Case

  @example """
           A Y
           B X
           C Z
           """
           |> String.trim()

  @example_solution 15

  test "example is solved" do
    assert ElixirAoc.Two.solve(@example) == @example_solution
  end

  test "rock paper scissors example" do
    assert ElixirAoc.Two.rps(:rock, :scissors) == :left
    assert ElixirAoc.Two.rps(:scissors, :rock) == :right
  end

  test "rps properties" do
    for h1 <- [:rock, :paper, :scissors] do
      for h2 <- [:rock, :paper, :scissors] do
        case ElixirAoc.Two.rps(h1, h2) do
          :left ->
            assert ElixirAoc.Two.rps(h2, h1) == :right

          :right ->
            assert ElixirAoc.Two.rps(h2, h1) == :left

          :draw ->
            assert ElixirAoc.Two.rps(h2, h1) == :draw
        end
      end
    end
  end

  test "score example" do
    assert ElixirAoc.Two.score(:paper, :rock) == 8
    assert ElixirAoc.Two.score(:rock, :paper) == 1
    assert ElixirAoc.Two.score(:scissors, :scissors) == 6
  end
end

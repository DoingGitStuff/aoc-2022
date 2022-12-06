defmodule ElixirAoc.FiveTest do
  use ExUnit.Case

  @example """
      [D]
  [N] [C]
  [Z] [M] [P]
  1   2   3

  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2
  """ |> String.trim()


  @solution 'CMZ'

  test "solves example" do
    assert ElixirAoc.Five.solve(@example) == @solution
  end

  test "split body and header" do
    {header, body} = ElixirAoc.Five.with_preset_header(@example |> String.split("\n"), ['NZ', 'DCM', 'P'])
    assert header == ['NZ', 'DCM', 'P']
    result = {header, body}
      |> ElixirAoc.Five.eval_body()
      |> ElixirAoc.Five.get_tops()
    assert result == 'CMZ'
  end


  test "parse intruction" do
    assert ElixirAoc.Five.parse_instr("move 1 from 2 to 1") == {1, 2, 1}
  end

  test "transform to single move form" do
    assert ElixirAoc.Five.to_single_form({2, 2, 1}) == [{2, 1}, {2, 1}]
  end
end

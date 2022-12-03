defmodule ElixirAoc.ThreeTest do
  use ExUnit.Case

  @example """
           vJrwpWtwJgWrhcsFMMfFFhFp
           jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
           PmmdzqPrVvPwwTWBwg
           wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
           ttgJtRGJQctTZtZT
           CrZsJsPPZsGzwwsLwLmpwMDw
           """ |> String.trim()

  @example_solution 157

  test "example is solved" do
    assert ElixirAoc.Three.solve(@example) == @example_solution
  end

  test "priority example" do
    input = 'pLPvts'
    output = [16, 38, 42, 22, 20, 19]
    assert Enum.map(input, &ElixirAoc.Three.priority/1) == output
  end

  test "find dup" do
    input = "vJrwpWtwJgWrhcsFMMfFFhFp"
    output = ?p
    assert ElixirAoc.Three.find_dup(input) == output
  end
end

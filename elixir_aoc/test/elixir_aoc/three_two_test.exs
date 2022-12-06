defmodule ElixirAoc.ThreeTwoTest do
  use ExUnit.Case

  @example """
           vJrwpWtwJgWrhcsFMMfFFhFp
           jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
           PmmdzqPrVvPwwTWBwg
           wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
           ttgJtRGJQctTZtZT
           CrZsJsPPZsGzwwsLwLmpwMDw
           """
           |> String.trim()

  @example_solution 70

  alias ElixirAoc.ThreeTwo

  test "example is solved" do
    assert ThreeTwo.solve(@example) == @example_solution
  end

  @groups [
    [
      "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
      "ttgJtRGJQctTZtZT",
      "CrZsJsPPZsGzwwsLwLmpwMDw"
    ],
    [
      "vJrwpWtwJgWrhcsFMMfFFhFp",
      "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
      "PmmdzqPrVvPwwTWBwg"
    ]
  ]
  test "group lines" do
    assert @example |> String.split("\n") |> ThreeTwo.group_lines() == @groups
  end

  @group_items [?Z, ?r]
  test "group items" do
    assert @groups |> Enum.map(&ThreeTwo.group_item/1) == @group_items
  end
end

defmodule ElixirAoc.SevenTwo do
  def input_file(), do: "7.txt"
  alias ElixirAoc.Seven

  def solve(input) do
    dirs =
      input
      |> Seven.calculate_file_sizes()

    root_size = Map.get(dirs, ["/"])
    space_needed = 30_000_000
    space_left = 70_000_000 - root_size
    space_to_free = space_needed - space_left

    dirs
    |> Enum.map(fn {_, n} -> n end)
    |> Enum.filter(&(&1 >= space_to_free))
    |> Enum.sort()
    |> hd()
  end
end

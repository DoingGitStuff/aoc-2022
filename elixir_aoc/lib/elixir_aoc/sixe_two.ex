defmodule ElixirAoc.SixTwo do
  def input_file(), do: "6.txt"

  def solve(input) do
    input
    |> String.to_charlist()
    |> Enum.chunk_every(14,1,:discard)
    |> Stream.with_index(14)
    |> Enum.into([])
    |> Enum.find(fn {char,_idx} -> Enum.uniq(char) |> Enum.count() == 14 end)
    |> fn {_,idx} -> idx end.()
  end

end

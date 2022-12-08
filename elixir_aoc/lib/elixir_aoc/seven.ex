defmodule ElixirAoc.Seven do
  def input_file(), do: "7.txt"

  def solve(input) do
    input
    |> calculate_file_sizes()
    |> Enum.sort_by(fn {_, v} -> v end)
    |> Enum.map(fn {_, n} -> n end)
    |> Enum.filter(&(&1 <= 100_000))
    |> Enum.sum()
  end

  def calculate_file_sizes(input) do
    input
    |> String.split("\n")
    |> Enum.map(&tokenise/1)
    |> Enum.reduce({["/"], %{}}, &eval_token/2)
    |> (fn {_, m} -> m end).()
  end

  def tokenise("$ " <> "ls"), do: {:ls}
  def tokenise("$ " <> "cd " <> dir), do: {:cd, dir}
  def tokenise("dir " <> dirname), do: {:dir, dirname}

  def tokenise(<<first_char, _rest::binary>> = file) when ?0 <= first_char and first_char <= ?9 do
    {size, " " <> filename} = Integer.parse(file)
    {:file, filename, size}
  end

  defp eval_token({:file, _filename, size}, _state = {path, dir_sizes}) do
    {_a, new_sizes} =
      List.foldr(path, {[], dir_sizes}, fn d, {old, m} ->
        {[d | old], Map.update(m, [d | old], size, fn v -> v + size end)}
      end)

    {path, new_sizes}
  end

  defp eval_token({:ls}, state = {_path, _dir_sizes}) do
    state
  end

  defp eval_token({:dir, dirname}, {path, dir_sizes}) do
    {path, Map.put(dir_sizes, [dirname | path], 0)}
  end

  defp eval_token({:cd, dirname}, {[_ | parent] = path, dir_sizes}) do
    case dirname do
      "/" -> {["/"], dir_sizes}
      ".." -> {parent, dir_sizes}
      _ -> {[dirname | path], dir_sizes}
    end
  end
end

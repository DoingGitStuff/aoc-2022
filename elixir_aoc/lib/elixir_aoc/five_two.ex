defmodule ElixirAoc.FiveTwo do
  def input_file(), do: "5.txt"
  alias ElixirAoc.Five
  def solve(input) do
    input
    |> String.split("\n")
    |> Five.with_preset_header([
      'ZVTBJGR',
      'LVRJ',
      'FQS',
      'GQVFLNHZ',
      'WMSCJTQR',
      'FHCTWS',
      'JNFVCZD',
      'QFRWDZGL',
      'PVWBJ'
    ])
    |> eval_body()
    |> Five.get_tops()
  end

  def eval_body({stacks, body}) do
    body
    |> Enum.map(&Five.parse_instr/1)
    |> Enum.reduce(stacks, &eval_instr/2)
  end

  def eval_instr({n,from,to},stacks) do
    {items, new_stack} = Enum.at(stacks, from - 1) |> Enum.split(n)

    dest = Enum.at(stacks, to - 1)

    List.replace_at(stacks, from - 1, new_stack)
    |> List.replace_at(to - 1, items ++ dest)
  end
end

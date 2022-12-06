defmodule ElixirAoc.Five do
  def input_file(), do: "5.txt"

  def solve(input) do
    input
    |> String.split("\n")
    |> with_preset_header([
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
    |> get_tops()
  end

  def with_preset_header(lines, header) do
    {header, Enum.drop_while(lines, &(not String.starts_with?(&1, "move")))}
  end

  def parse_instr("move " <> x_from_a_to_b) do
    {x, " from " <> a_to_b} = Integer.parse(x_from_a_to_b)
    {a, " to " <> rest} = Integer.parse(a_to_b)
    {b, _end} = Integer.parse(rest)
    {x, a, b}
  end

  def to_single_form({times, a, b}) do
    List.duplicate({a, b}, times)
  end

  def eval_body({stacks, body}) do
    body
    |> Enum.map(&parse_instr/1)
    |> Enum.flat_map(&to_single_form/1)
    |> Enum.reduce(stacks, &eval_instr/2)
  end

  def eval_instr({from, to}, stacks) do
    [x | new_stack] = Enum.at(stacks, from - 1)

    dest = Enum.at(stacks, to - 1)

    List.replace_at(stacks, from - 1, new_stack)
    |> List.replace_at(to - 1, [x | dest])
  end

  def get_tops(header) do
    header
    |> Enum.map(&hd/1)
  end
end

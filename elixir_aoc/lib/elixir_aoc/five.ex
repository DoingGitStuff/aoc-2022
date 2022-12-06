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

  def parse_header(lines) do
    header_lines =
      lines
      |> Enum.take_while(fn line -> not String.starts_with?(line, " 1") end)

    len = length(header_lines)
    rest = Enum.drop(lines, len)

    stacks =
      header_lines
      |> Enum.map(&parse_header_line/1)
      |> Enum.reverse()
      |> Enum.reduce(&merge_stk_lines/2)

    # nums = List.last(header_lines)

    {stacks, rest}
  end

  def parse_header_line(line) do
    indexed_chunks =
      String.to_charlist(line)
      |> Enum.chunk_every(4)
      |> Stream.with_index()

    stk_line =
      indexed_chunks
      |> Enum.map(fn {chunk, idx} -> {Enum.at(chunk, 1), idx + 1} end)
      |> Enum.filter(fn {c, _idx} -> c != ?\s end)

    stacks = Enum.count(indexed_chunks)
    start = List.duplicate([], stacks) ++ [Enum.map(stk_line, fn {c, _idx} -> c end)]
    instrs = Enum.map(stk_line, fn {_c, idx} -> {stacks + 1, idx} end)
    Enum.reduce(instrs, start, &eval_instr/2) |> Enum.take(stacks)
  end

  def merge_stk_lines(line, acc) do
    Enum.zip(line, acc)
    |> Enum.map(fn {l, a} -> l ++ a end)
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

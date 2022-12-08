defmodule Mix.Tasks.Solutions do
  use Mix.Task

  @solutions %{
    "1" => ElixirAoc.One,
    "1.2" => ElixirAoc.Onetwo,
    "2" => ElixirAoc.Two,
    "2.2" => ElixirAoc.Twotwo,
    "3" => ElixirAoc.Three,
    "3.2" => ElixirAoc.ThreeTwo,
    "4" => ElixirAoc.Four,
    "4.2" => ElixirAoc.FourTwo,
    "5" => ElixirAoc.Five,
    "5.2" => ElixirAoc.FiveTwo,
    "6" => ElixirAoc.Six,
    "6.2" => ElixirAoc.SixTwo,
  }

  def run(args) do
    solutions_keys =
      @solutions
      |> Map.keys()

    run_order =
      solutions_keys
      |> Enum.filter(&(args == [] or &1 in args))
      |> :lists.sort()

    for k <- run_order do
      mod = Map.get(@solutions, k)
      input_file = apply(mod, :input_file, [])
      priv_dir = Path.join([".", "priv"])
      filepath = Path.join([priv_dir, input_file])

      exists = File.exists?(filepath)
      IO.puts("#{filepath} exists=#{exists}")

      if exists do
        {:ok, input_txt} = File.read(filepath)
        input = String.trim(input_txt)
        IO.puts("#{k} = #{apply(mod, :solve, [input])}")
      end
    end
  end
end

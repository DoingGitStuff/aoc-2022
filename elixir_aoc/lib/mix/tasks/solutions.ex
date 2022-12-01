defmodule Mix.Tasks.Solutions do
  use Mix.Task

  @solutions %{
    "1" => ElixirAoc.One,
    "1.2" => ElixirAoc.Onetwo,
  }

  def run(args) do
    solutions_keys =
      @solutions
      |> Map.keys()

    run_order =
      solutions_keys
      |> Enum.filter(&(length(args) == 0 or &1 in args))
      |> :lists.sort()

    for k <- run_order do
      mod = Map.get(@solutions,k)
      input_file = apply(mod,:input_file,[])
      priv_dir = Path.join([".","priv"])
      filepath = Path.join([priv_dir,input_file])

      exists = File.exists?(filepath)
      IO.puts("#{filepath} exists=#{exists}")
      if exists do
        {:ok,input_txt} = File.read(filepath)
        input = String.trim(input_txt)
        IO.puts("#{k} = #{apply(mod,:solve,[input])}")
      end
    end
  end
end

defmodule ElixirAoc.SixTest do
  use ExUnit.Case

  alias ElixirAoc.Six

  @example """
  $ cd /
  $ ls
  dir a
  14848514 b.txt
  8504156 c.dat
  dir d
  $ cd a
  $ ls
  dir e
  29116 f
  2557 g
  62596 h.lst
  $ cd e
  $ ls
  584 i
  $ cd ..
  $ cd ..
  $ cd d
  $ ls
  4060174 j
  8033020 d.log
  5626152 d.ext
  7214296 k
  """ |> String.trim()

  @solution 95_437

  test "tokenising" do
    file = Six.tokenise("64971 dhmprc.qpl")
    assert file = {64_971, "dhmprc.qpl"}
    dir = Six.tokenise("dir jtgbg")
    assert dir  = {:dir, "jtgbg"}
    cd = Six.tokenise("$ cd gbjh")
    assert cd = {:cd, "gbjh"}
    ls = Six.tokenise("$ ls")
    assert ls = {:ls}
    cd_back = Six.tokenise("$ cd ..")
    assert  cd_back = {:cd, ".."}
  end
  test "solves example" do
    assert Six.solve(@example) == @solution
  end
end

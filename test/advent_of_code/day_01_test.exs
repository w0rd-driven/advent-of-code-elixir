defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    input = [1721, 979, 366, 299, 675, 1456]

    assert 514579 = part1(input)
  end
end

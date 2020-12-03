defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  test "part1" do
    input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]

    assert 2 = part1(input)
  end

  test "part2" do
    input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]

    assert 1 = part2(input)
  end
end

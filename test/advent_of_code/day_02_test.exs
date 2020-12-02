defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  test "part1" do
    input = ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"]

    assert 2 = part1(input)
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end

defmodule AdventOfCode.Day15Test do
  use ExUnit.Case

  import AdventOfCode.Day15

  test "part1" do
    input = get_input()
    assert 436 = part1(input)

    input2 = [1, 3, 2]
    assert 1 = part1(input2)

    input3 = [2, 1, 3]
    assert 10 = part1(input3)

    input4 = [1, 2, 3]
    assert 27 = part1(input4)

    input5 = [2, 3, 1]
    assert 78 = part1(input5)

    input6 = [3, 2, 1]
    assert 438 = part1(input6)

    input6 = [3, 1, 2]
    assert 1836 = part1(input6)
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end

  def get_input do
    "../../lib/data/day_15_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
  end
end

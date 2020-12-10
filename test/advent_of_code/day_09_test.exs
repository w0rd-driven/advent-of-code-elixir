defmodule AdventOfCode.Day09Test do
  use ExUnit.Case

  import AdventOfCode.Day09

  test "part1" do
    input = get_input()

    assert 127 = part1(input, 5)
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end

  def get_input do
    "../../lib/data/day_09_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
  end
end

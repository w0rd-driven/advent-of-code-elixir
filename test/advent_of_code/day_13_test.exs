defmodule AdventOfCode.Day13Test do
  use ExUnit.Case

  import AdventOfCode.Day13

  test "part1" do
    input = get_input()

    assert 295 = part1(input)
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end

  def get_input do
    "../../lib/data/day_13_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
  end
end

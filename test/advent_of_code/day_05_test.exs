defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  test "part1" do
    input = get_input()

    assert 820 = part1(input)
  end

  @tag :skip
  test "part2" do
    input = get_input()

    assert 820 = part2(input)
  end

  def get_input do
    "../../lib/data/day_05_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list()
  end
end

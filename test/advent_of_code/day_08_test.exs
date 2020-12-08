defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  test "part1" do
    input = get_input()

    assert 5 = part1(input)
  end

  test "part2" do
    input = get_input()

    assert 8 = part2(input)
  end

  def get_input do
    "../../lib/data/day_08_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Enum.to_list()
  end
end

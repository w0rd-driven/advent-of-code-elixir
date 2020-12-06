defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  test "part1" do
    input = get_input()

    assert 11 = part1(input)
  end

  test "part2" do
    input = get_input()

    assert 6 = part2(input)
  end

  def get_input do
    # See https://elixirforum.com/t/streaming-lines-from-an-enum-of-chunks/21244 for chunking work up
    "../../lib/data/day_06_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!([], 2048) # chunks instead of lines
    |> Stream.transform("", fn chunk, acc ->
      [last_line | lines] =
          acc <> chunk
          |> String.split("\n\n")
          |> Enum.reverse()
      {Enum.reverse(lines),last_line}
    end)
    |> Stream.map(&(String.split(&1, "\n")))
    |> Enum.to_list()
  end
end

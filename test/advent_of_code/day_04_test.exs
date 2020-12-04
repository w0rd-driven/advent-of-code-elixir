defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  test "part1" do
    input = get_input()

    assert 2 = part1(input)
  end

  def get_input do
    # See https://elixirforum.com/t/streaming-lines-from-an-enum-of-chunks/21244 for chunking work up
    "../../lib/data/day_04_test.txt" # Eww but I don't care right now
    |> Path.expand(__DIR__)
    |> File.stream!([], 2048) # chunks instead of lines
    |> Stream.transform("", fn chunk, acc ->
      [last_line | lines] =
          acc <> chunk
          |> String.split("\n\n")
          |> Enum.reverse()
      {Enum.reverse(lines),last_line}
    end)
    |> Stream.map(&(String.replace(&1, "\n", " ")))
    |> Enum.to_list()
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end

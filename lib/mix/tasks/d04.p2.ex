defmodule Mix.Tasks.D04.P2 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 2"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end

  def get_input do
    # See https://elixirforum.com/t/streaming-lines-from-an-enum-of-chunks/21244 for chunking work up
    "../../data/day_04.txt"
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
end

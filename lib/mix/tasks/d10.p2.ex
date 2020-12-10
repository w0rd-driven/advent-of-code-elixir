defmodule Mix.Tasks.D10.P2 do
  use Mix.Task

  import AdventOfCode.Day10

  @shortdoc "Day 10 Part 2"
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
    "../../data/day_10.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.to_list()
  end
end

defmodule AdventOfCode.Day09 do
  def part1(input, preamble_length \\ 25) do
    { preamble, message } = input |> Enum.split(preamble_length)
    preamble |> IO.inspect(label: "Preamble")
    message |> IO.inspect(label: "Message")
    
  end

  def part2(_input) do
  end
end

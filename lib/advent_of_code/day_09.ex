defmodule AdventOfCode.Day09 do
  def part1(input, preamble_length \\ 25) do
    { preamble, message } = input |> Enum.split(preamble_length)
    preamble |> IO.inspect(label: "Preamble")
    message |> IO.inspect(label: "Message")
    valid = for total <- message do
      total |> IO.inspect(label: "Total")
      for number_1 <- preamble, number_2 <- preamble, number_1 + number_2 == total do
        number_1 |> IO.inspect(label: "1")
        number_2 |> IO.inspect(label: "2")
        total
      end
    end
    # valid |> IO.inspect(label: "Valid")
  end

  def part2(_input) do
  end
end

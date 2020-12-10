defmodule AdventOfCode.Day09 do
  def part1(input, preamble_length \\ 25) do
    input
    |> Stream.chunk_every(preamble_length + 1, 1)
    |> Enum.find_value(fn list ->
      {total, preamble} = List.pop_at(list, -1)
      # list |> Enum.to_list() |> IO.inspect(label: "List")
      # total |> IO.inspect(label: "Total")
      # preamble |> IO.inspect(label: "Preamble")

      combinations =
        for number_1 <- preamble, number_2 <- preamble, uniq: true do
          [number_1, number_2] |> Enum.sort() |> List.to_tuple()
        end

      # combinations |> IO.inspect(label: "Combinations")
      valid? = Enum.any?(combinations, fn {number_1, number_2} -> number_1 + number_2 == total end)

      unless valid?, do: total
    end)
  end

  def part2(_input) do
  end
end

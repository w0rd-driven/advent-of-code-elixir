defmodule AdventOfCode.Day04 do

  def part1(input) do
    passports = input |> parse_passports
    passports |> IO.inspect(label: "Passports")
  end

  defp parse_passports(input) do
    input |> IO.inspect(label: "Passports")
  end

  def part2(_input) do
  end
end

defmodule AdventOfCode.Day04 do

  def part1(input) do
    passports = input |> parse_passports
    passports |> IO.inspect(label: "Passports")
  end

  defp parse_passports(input) do
    count = for passport <- input do
      passport |> is_passport_valid()
    end
    count |> Enum.count()
  end

  defp is_passport_valid(passport) do
    passport |> IO.inspect(label: "Passport")
    true
  end

  def part2(_input) do
  end
end

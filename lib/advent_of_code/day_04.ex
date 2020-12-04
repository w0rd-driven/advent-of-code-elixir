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
    # passport |> IO.inspect(label: "Passport")
    true
    valid_keys = [
      "byr",
      "iyr",
      "eyr",
      "hgt",
      "hcl",
      "ecl",
      "pid",
      # "cid", # We don't care to include this based on the puzzle gotcha
    ]
    fields = passport |> String.replace("\n", " ") |> String.split(" ") # Single new lines need to be converted to spaces
    for field <- fields do
      field |> IO.inspect(label: "Field")
      [key, value] = field |> String.split(":") # Oh snaps I'm learning
      key |> IO.inspect(label: "Key")
      value |> IO.inspect(label: "Value")
    end
  end

  def part2(_input) do
  end
end

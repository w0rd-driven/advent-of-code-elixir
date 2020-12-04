defmodule AdventOfCode.Day04 do

  def part1(input) do
    _passports = input |> parse_passports
    # passports |> IO.inspect(label: "Passports")
  end

  defp parse_passports(input) do
    # input |> Enum.count |> IO.inspect(label: "Total")
    passports_checked = for passport <- input do
      passport |> is_passport_valid()
    end
    # passports_checked |> IO.inspect(label: "Passports Checked")
    passports_checked |> Enum.count(fn x -> x == true end)
  end

  defp is_passport_valid(passport) do
    # passport |> IO.inspect(label: "Passport")
    valid_keys = [
      "byr",
      "iyr",
      "eyr",
      "hgt",
      "hcl",
      "ecl",
      "pid",
      "cid",
    ]
    fields = passport |> String.split(" ")
    keys = for field <- fields do
      # field |> IO.inspect(label: "Field")
      [key, _value] = field |> String.split(":") # Oh snaps I'm learning
      # key |> IO.inspect(label: "Key")
      key
    end
    # keys |> IO.inspect(label: "Keys")
    # check = valid_keys |> Enum.all?(fn x -> x in keys end)
    # We convert the 2 lists to a mapset to get the difference. If cid is present, we ignore by deleting.
    check = MapSet.difference(MapSet.new(valid_keys), MapSet.new(keys)) |> Enum.filter(fn key -> key != "cid" end)
    check |> IO.inspect(label: "Check")
    # check |> Enum.all?()
  end

  def part2(_input) do
  end
end

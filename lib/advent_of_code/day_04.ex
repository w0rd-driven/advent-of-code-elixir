defmodule AdventOfCode.Day04 do

  def part1(input) do
    _passports = input |> parse_passports
    # passports |> IO.inspect(label: "Passports")
  end

  defp parse_passports(input) do
    # input |> Enum.count |> IO.inspect(label: "Total")
    passports_checked = for passport <- input do
      passport |> has_required_fields()
    end
    # passports_checked |> IO.inspect(label: "Passports Checked")
    passports_checked |> Enum.count(fn x -> Enum.empty?(x) end)
  end

  defp has_required_fields(passport) do
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
    # We convert the 2 lists to a mapset to get the difference. If cid is present, we ignore by deleting.
    check = MapSet.difference(MapSet.new(valid_keys), MapSet.new(keys)) |> Enum.filter(fn key -> key != "cid" end)
    # check |> IO.inspect(label: "Check")
    check
  end

  def part2(input) do
    _passports = input |> parse_passports2
    # passports |> IO.inspect(label: "Passports")
  end

  defp parse_passports2(input) do
    # input |> Enum.count |> IO.inspect(label: "Total")
    passports_checked = for passport <- input do
      required_fields = passport |> has_required_fields() |> Enum.empty?()
      # required_fields |> IO.inspect(label: "Required Fields")
      valid_fields = passport |> passport_validate() |> Enum.all?(fn x -> x == true end)
      # valid_fields |> IO.inspect(label: "Valid Fields")

      if required_fields == true and required_fields == valid_fields do
        true
      else
        false
      end
    end
    # passports_checked |> IO.inspect(label: "Passports Checked")
    passports_checked |> Enum.count(fn x -> x == true end)
  end

  defp passport_validate(passport) do
    # passport |> IO.inspect(label: "Passport")
    fields = passport |> get_values()
    # fields |> IO.inspect(label: "Fields")
    count = for field <- fields do
      # field |> IO.inspect(label: "Field")
      case field.key do
        "byr" ->
          field.value >= "1920" or field.value <= "2002"
        "iyr" ->
          field.value >= "2010" or field.value <= "2020"
        "eyr" ->
          field.value >= "2020" or field.value <= "2030"
        "hgt" ->
          field.value |> height_valid()
        "hcl" ->
          field.value |> hair_color_valid()
        "ecl" ->
          field.value in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
        "pid" ->
          field.value |> id_valid()
        "cid" ->
          true
      end
    end

    count
  end

  defp get_values(passport) do
    # passport |> IO.inspect(label: "Passport")
    fields = passport |> String.split(" ")
    map = for field <- fields do
      # field |> IO.inspect(label: "Field")
      [key, value] = field |> String.split(":") # Oh snaps I'm learning
      Map.new(%{:key => key, :value => value})
    end
    map
  end

  defp height_valid(value) do
    [height, unit] = value |> String.split(~r{cm|in}, include_captures: true, parts: 2, trim: true)
    # height |> IO.inspect(label: "Height")
    # unit |> IO.inspect(label: "Unit")
    check = case unit do
      "cm" ->
        height >= 150 or height <= 193
      "in" ->
        height >= 59 or height <= 76
      _ ->
        false
    end
    # check |> IO.inspect(label: "Check")

    check
  end

  defp hair_color_valid(value) do
    value |> String.match?(~r/^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/)
  end

  defp id_valid(value) do
    value |> String.match?(~r/^[\d]{9}$/)
  end
end

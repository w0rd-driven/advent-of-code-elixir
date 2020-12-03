defmodule AdventOfCode.Day02 do
  def part1(input) do
    # input |> IO.inspect(label: "Input")
    count = for rule <- input do
      rule_count(rule)
    end

    _result = count |> Enum.sum
    # count |> IO.inspect(label: "Counts")
    # result |> IO.inspect(label: "Result")
  end

  defp rule_count(rule) do
    # rule |> IO.inspect(label: "Rule")
    parts = rule |> String.split(": ")
                 |> (fn [key, value] -> [{:policy, key}, {:password, value}] end).()
    result = policy_parse(parts)
    # result |> IO.inspect(label: "Result")
    result
  end

  defp policy_parse(parts) do
    # parts |> IO.inspect(label: "Parts")
    policy = parts |> Keyword.get(:policy)
    # policy |> IO.inspect(label: "Policy")
    policy_parts = policy |> String.split(" ")
                          |> (fn [key, value] -> [{:range, key}, {:letter, value}] end).()
    # policy_parts |> IO.inspect(label: "Policy Parts")
    range = policy_parts |> Keyword.get(:range)
    # range |> IO.inspect(label: "Policy Range")
    range_parts = range |> String.split("-")
                        |> (fn [key, value] -> [{:min, key}, {:max, value}] end).()
    # range_parts |> IO.inspect(label: "Range Parts")
    min = range_parts |> Keyword.get(:min)
    # min |> IO.inspect(label: "Policy Range Min")
    max = range_parts |> Keyword.get(:max)
    # max |> IO.inspect(label: "Policy Range Max")
    letter = policy_parts |> Keyword.get(:letter)
    # letter |> IO.inspect(label: "Policy Letter")

    password = parts |> Keyword.get(:password)
    # password |> IO.inspect(label: "Password")
    characters = character_count(password)
    # characters |> IO.inspect(label: "Password characters")
    letter_count = characters |> Map.get(letter, 0) # default to 0 instead of nil
    # letter_count |> IO.inspect(label: "Letter count")

    # If the count falls within parameters, return a 1 to increment or 0 stay put
    if letter_count in String.to_integer(min)..String.to_integer(max) do
      1
    else
      0
    end
  end

  defp character_count(password) do
    password
      |> String.graphemes()
      |> Enum.reduce(%{}, fn char, acc ->
           case acc do
             %{^char => count} -> %{acc | char => count + 1}
             _ -> Map.put(acc, char, 1)
           end
         end)
  end

  def part2(input) do
    # input |> IO.inspect(label: "Input")
    count = for rule <- input do
      rule2_count(rule)
    end

    _result = count |> Enum.sum
    # count |> IO.inspect(label: "Counts")
    # result |> IO.inspect(label: "Result")
  end

  defp rule2_count(rule) do
    # rule |> IO.inspect(label: "Rule")
    parts = rule |> String.split(": ")
                 |> (fn [key, value] -> [{:policy, key}, {:password, value}] end).()
    result = policy2_parse(parts)
    # result |> IO.inspect(label: "Result")
    result
  end

  defp policy2_parse(parts) do
    # parts |> IO.inspect(label: "Parts")
    policy = parts |> Keyword.get(:policy)
    # policy |> IO.inspect(label: "Policy")
    policy_parts = policy |> String.split(" ")
                          |> (fn [key, value] -> [{:range, key}, {:letter, value}] end).()
    # policy_parts |> IO.inspect(label: "Policy Parts")
    range = policy_parts |> Keyword.get(:range)
    # range |> IO.inspect(label: "Policy Range")
    range_parts = range |> String.split("-")
                        |> (fn [key, value] -> [{:first, key}, {:second, value}] end).()
    # range_parts |> IO.inspect(label: "Range Parts")
    first = range_parts |> Keyword.get(:first) |> String.to_integer()
    # first |> IO.inspect(label: "Policy First Instance")
    second = range_parts |> Keyword.get(:second) |> String.to_integer()
    # second |> IO.inspect(label: "Policy Second Instance")
    letter = policy_parts |> Keyword.get(:letter)
    # letter |> IO.inspect(label: "Policy Letter")

    password = parts |> Keyword.get(:password)
    # password |> IO.inspect(label: "Password")

    first_instance = password |> String.at(first - 1)
    # first_instance |> IO.inspect(label: "First Letter")
    second_instance = password |> String.at(second - 1)
    # second_instance |> IO.inspect(label: "Second Letter")

    # If only one of the instances are true, return 1, otherwise return 0
    first_count = first_instance |> letter_count(letter)
    # first_count |> IO.inspect(label: "First Check")
    second_count = second_instance |> letter_count(letter)
    # second_count |> IO.inspect(label: "Second Check")

    count = first_count + second_count

    if count == 1 do
      1
    else
      0
    end
  end

  defp letter_count(instance, letter) do
    if instance == letter do
      1
    else
      0
    end
  end
end

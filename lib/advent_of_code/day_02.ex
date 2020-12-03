defmodule AdventOfCode.Day02 do
  def part1(input) do
    # input |> IO.inspect(label: "Input")

    count = 0
    for rule <- input do
      count + rule_count(rule)
    end
  end

  def part2(_input) do
  end

  defp rule_count(rule) do
    # rule |> IO.inspect(label: "Rule")
    parts = rule |> String.split(": ")
                #  |> (fn [key, value] -> {key, value} end).()
                #  |> (fn [key, value] -> {{:policy, key}, {:password, value}} end).()
                 |> (fn [key, value] -> [{:policy, key}, {:password, value}] end).()
    result = policy_parse(parts)
    result |> IO.inspect(label: "Result")
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
    min |> IO.inspect(label: "Policy Range Min")
    max = range_parts |> Keyword.get(:max)
    max |> IO.inspect(label: "Policy Range Max")
    letter = policy_parts |> Keyword.get(:letter)
    letter |> IO.inspect(label: "Policy Letter")

    password = parts |> Keyword.get(:password)
    # password |> IO.inspect(label: "Password")
    characters = character_count(password)
    characters |> IO.inspect(label: "Password characters")
    letter_count = characters |> Map.get(letter, 0) # default to 0 instead of nil
    letter_count |> IO.inspect(label: "Password count")

    # If the count falls within parameters, return a 1 to increment or 0 stay put
    cond do
      letter_count == 0 or letter_count == nil ->
        0
      letter_count >= min or letter_count <= max ->
        1
      true ->
        0
    end
  end

  defp character_count(password) do
    password
      # |> Map.new( &{<<&1 :: utf8>>,
      #    Enum.count(password, fn x -> &1 == x end)}
      # )
      |> String.graphemes()
      |> Enum.reduce(%{}, fn char, acc ->
           case acc do
             %{^char => count} -> %{acc | char => count + 1}
             _ -> Map.put(acc, char, 1)
           end
         end)
  end
end

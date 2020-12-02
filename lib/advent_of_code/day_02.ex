defmodule AdventOfCode.Day02 do
  def part1(input) do
    input |> IO.inspect(label: "Input")

    count = 0
    for rule <- input do
      count + get_count(rule)
    end
  end

  def part2(_input) do
  end

  defp get_count(rule) do
    rule |> IO.inspect(label: "Rule")
    # parts = rule |> String.split(": ")
    parts = rule |> String.split(": ")
                #  |> Map.new(fn [key, value] -> {key, value} end)
                #  |> Enum.into(%{}, fn [key, value] -> {key, value} end)
                #  |> Keyword.new([:policy, :password], fn [key, value] -> {key, value} end)
                #  |> Keyword.new()
                #  |> (fn [key, value] -> {key, value} end).()
                 |> (fn [key, value] -> [{:policy, key}, {:password, value}] end).()
                #  |> List.to_tuple
    parts |> IO.inspect(label: "Parts")
    1
  end
end

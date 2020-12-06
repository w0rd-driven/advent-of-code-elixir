defmodule AdventOfCode.Day06 do
  def part1(input) do
    _answers = input |> parse_answers()
  end

  defp parse_answers(answers) do
    # answers |> IO.inspect(label: "Answers")
    groups = for answer <- answers do
      answer |> Enum.join() |> String.graphemes() |> Enum.uniq() |> Enum.count()
    end
    # groups |> IO.inspect(label: "Groups")
    groups |> Enum.sum()
  end

  def part2(input) do
    _answers = input |> parse_answers2()
  end

  defp parse_answers2(answers) do
    # answers |> IO.inspect(label: "Answers")
    groups = for answer <- answers do
      answer |> passenger_count()
    end
    # groups |> IO.inspect(label: "Groups")
    groups |> Enum.sum()
  end

  defp passenger_count(group) do
    passengers = group |> Enum.count()
    # passengers |> IO.inspect(label: "Passengers")
    if passengers == 1 do
      List.first(group) |> String.graphemes() |> Enum.count()
    else
      characters = group |> Enum.join() |> character_count()
      # characters |> IO.inspect(label: "Characters")
      _count = characters |> Enum.reduce(0, fn {_char, count}, acc ->
        if count == passengers, do: acc + 1, else: acc
      end)
      # count |> IO.inspect(label: "Count")
    end
  end

  defp character_count(input) do
    input
      |> String.graphemes()
      |> Enum.reduce(%{}, fn char, acc ->
           case acc do
             %{^char => count} -> %{acc | char => count + 1}
             _ -> Map.put(acc, char, 1)
           end
         end)
  end

end

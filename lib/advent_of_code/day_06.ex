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

  def part2(_input) do
  end
end

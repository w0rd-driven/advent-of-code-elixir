defmodule AdventOfCode.Day06 do
  def part1(input) do
    answers = input |> parse_answers
  end

  defp parse_answers(answers) do
    answers |> IO.inspect(label: "Answers")
    groups = for answer <- answers do
      values = for value <- answer do
        value |> String.graphemes()
      end
      values |> IO.inspect(label: "Values")
    end
    groups |> IO.inspect(label: "Groups")
  end

  def part2(_input) do
  end
end

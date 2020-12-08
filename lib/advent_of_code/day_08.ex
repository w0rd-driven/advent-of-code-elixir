defmodule AdventOfCode.Day08 do
  def part1(input) do
    count = for instruction <- input do
      instruction |> parse_instruction()
    end
  end

  defp parse_instruction(instruction) do
    instruction |> IO.inspect(label: "Instruction")
    # parts = Regex.named_captures(~r/(?<instruction>nop|acc|jmp) (?<sign>\+|\-)(?<number>\d*)$/, instruction)
    parts = Regex.run(~r/(\w+)\s((?:\+|-)\d+)/, instruction, capture: :all_but_first)
    parts |> IO.inspect(label: "Parts")
  end

  def part2(_input) do
  end
end

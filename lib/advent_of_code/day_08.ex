defmodule AdventOfCode.Day08 do
  def part1(input) do
    instructions = for instruction <- input do
      instruction |> parse_instruction()
    end
    # instructions |> IO.inspect(label: "Instructions")
    {:loop, {_, acc, _}} = run_program(instructions, {0, 0, MapSet.new()})
    acc
  end

  defp parse_instruction(instruction) do
    # instruction |> IO.inspect(label: "Instruction")
    _parts = Regex.run(~r/(\w+)\s((?:\+|-)\d+)/, instruction, capture: :all_but_first)
    # parts |> IO.inspect(label: "Parts")
  end

  def run_program(instruction, {index, acc, seen}) when index >= length(instruction),
    do: {:end, {index, acc, seen}}

  def run_program(instruction, {index, acc, seen}) do
    inst = Enum.at(instruction, index)
    # inst |> IO.inspect(label: "Instruction")

    cond do
      MapSet.member?(seen, index) ->
        {:loop, {index, acc, seen}}

      true ->
        case inst do
          ["nop", _] ->
            run_program(instruction, {index + 1, acc, MapSet.put(seen, index)})
          ["acc", value] ->
            run_program(instruction, {index + 1, acc + String.to_integer(value), MapSet.put(seen, index)})
          ["jmp", value] ->
            run_program(instruction, {index + String.to_integer(value), acc, MapSet.put(seen, index)})
        end
    end
  end

  def part2(_input) do
  end
end

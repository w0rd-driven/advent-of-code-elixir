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

  def part2(input) do
    instructions = for instruction <- input do
      instruction |> parse_instruction()
    end
    # instructions |> IO.inspect(label: "Instructions")

    modifiable = instructions
    |> Enum.with_index()
    |> Enum.reduce([], fn
      {[x, _], index}, acc when x in ~w(jmp nop) -> [index | acc]
      {_, _}, acc -> acc
    end)

    # modifiable |> IO.inspect(label: "Modifiable")

    {_, acc, _} = brute_force(modifiable, instructions)
    acc
  end

  def brute_force([value | tail], input) do
    # input |> IO.inspect(label: "Brute")

    modified =
      List.update_at(input, value, fn
        ["jmp", value] -> ["nop", value]
        ["nop", value] -> ["jmp", value]
      end)

    case run_program(modified, {0, 0, MapSet.new()}) do
      {:loop, _} -> brute_force(tail, input)
      {:end, result} -> result
    end
  end
end

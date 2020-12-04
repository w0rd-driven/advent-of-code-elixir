defmodule AdventOfCode.Day03 do

  @spec part1(list | %{length: any}) :: any
  def part1(input) do
    map = input |> build_map
    count = map |> traverse_map(3, 1)
    # count |> IO.inspect(label: "Trees")
    count
  end

  @spec build_map(list | %{length: any}) :: any
  defp build_map(input) do
    # input |> IO.inspect(label: "Input")
    height = input |> Enum.count()
    # height |> IO.inspect(label: "Map Height")
    width = input |> List.first() |> String.length()
    # width |> IO.inspect(label: "Map Width")
    required = Kernel.ceil((height * 3) / width) # Our slope is 3 across, 1 down
    # required |> IO.inspect(label: "Map Required Sections")
    map = input |> Enum.map(fn (row) ->
      row |> String.duplicate(required)
    end)
    map
  end

  @spec traverse_map(list | %{length: any}, integer(), integer()) :: any
  defp traverse_map(input, slope_x, _slope_y) do
    # height = input |> Enum.count()
    # height |> IO.inspect(label: "Map Height")
    width = input |> List.first() |> String.length()
    # width |> IO.inspect(label: "Map Width")
    count = input
    |> Enum.with_index
    |> Enum.filter(fn({line, index}) ->
      # line |> IO.inspect(label: "Line")
      column = Integer.mod(index * slope_x, width)
      # column |> IO.inspect(label: "Col")
      inspect = line |> String.at(column)
      # inspect |> IO.inspect(label: "Value")
      # We skip the first row as the y value is always 1
      if index == 0 do
        false
      end
      if inspect == "#" do
        true
      end
    end)
    count |> Enum.count()
  end

  def part2(_input) do
  end
end

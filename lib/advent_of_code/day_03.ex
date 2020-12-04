defmodule AdventOfCode.Day03 do

  @spec part1(list | %{length: any}) :: non_neg_integer
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

  def part2(input) do
    slopes = [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2},
    ]
    map = input |> build_map2
    count = Enum.reduce(slopes, 1, fn slope, acc ->
      acc * count_trees(map, slope)
    end)
    count
  end

  @spec build_map2(list | %{length: any}) :: any
  defp build_map2(input) do
    # input |> IO.inspect(label: "Input")
    height = input |> Enum.count()
    # height |> IO.inspect(label: "Map Height")
    width = input |> List.first() |> String.length()
    # width |> IO.inspect(label: "Map Width")
    required = Kernel.ceil((height * 7) / width) # Our slope is 3 across, 1 down
    # required |> IO.inspect(label: "Map Required Sections")
    map = input |> Enum.map(fn (row) ->
      row |> String.duplicate(required)
    end)
    map
  end

  def count_trees(input, {step_x, step_y}) do
    {_, trees} =
      Enum.take_every(input, step_y)
      |> Enum.map(&String.to_charlist/1)
      |> Enum.reduce({0, 0}, fn row, {x, trees} ->
        trees =
          case Stream.cycle(row) |> Enum.at(x) do
            ?# -> trees + 1
            ?. -> trees
          end
        {x + step_x, trees}
      end)
    trees
  end

end

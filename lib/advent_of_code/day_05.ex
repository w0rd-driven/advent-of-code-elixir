defmodule AdventOfCode.Day05 do
  def part1(input) do
    seats = input |> parse_seats
    seats |> Enum.max()
  end

  defp parse_seats(seats) do
    # seats |> IO.inspect(label: "Seats")
    for seat <- seats do
      {row, column} = seat |> parse_seat

      # row |> IO.inspect(label: "Row")
      # column |> IO.inspect(label: "Column")

      row * 8 + column
    end
  end

  defp parse_seat(seat) do
    # [rows, columns] = seat |> String.split_at(7)
    {rows, columns} = seat |> String.split_at(7)

    # rows |> IO.inspect(label: "Rows")
    # columns |> IO.inspect(label: "Columns")

    {rows |> String.graphemes() |> parse_row(), columns |> String.graphemes() |> parse_column()}
  end

  defp new_range(range, keep_lower) do
    [lower, upper] = range
    # lower |> IO.inspect(label: "Lower")
    # upper |> IO.inspect(label: "Upper")

    new_lower = if keep_lower == false, do: lower + Kernel.ceil((upper - lower) / 2), else: lower
    new_upper = if keep_lower == true, do: upper - Kernel.ceil((upper - lower) / 2), else: upper

    # new_lower |> IO.inspect(label: "New Lower")
    # new_upper |> IO.inspect(label: "New Upper")
    [new_lower, new_upper]
  end

  defp parse_row(row) do
    [lower, _upper] = row |> Enum.reduce([0, 127], fn char, acc ->
      acc |> new_range(char == "F")
    end)

    lower
  end

  defp parse_column(column) do
    [_lower, upper] = column |> Enum.reduce([0, 7], fn char, acc ->
      acc |> new_range(char == "L")
    end)

    upper
  end

  def part2(input) do
    seats = input |> parse_seats |> Enum.sort()
    min = seats |> List.first()
    # min |> IO.inspect(label: "Min")
    max = seats |> Enum.max()
    # max |> IO.inspect(label: "Max")
    all_values = Enum.to_list(min..max)
    # all_values |> IO.inspect(label: "Values")
    [check] = MapSet.difference(MapSet.new(all_values), MapSet.new(seats)) |> MapSet.to_list()
    check
  end
end

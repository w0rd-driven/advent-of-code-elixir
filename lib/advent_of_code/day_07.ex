defmodule AdventOfCode.Day07 do
  def part1(input) do
    count = for rule <- input do
      rule |> parse_rule()
    end

  end

  defp parse_rule(rule) do
    rule |> IO.inspect(label: "Rule")
    parts = rule |> String.split(" bags contain ")
                 |> (fn [key, value] -> [{:bag, key}, {:contents, value}] end).()
    # parts |> IO.inspect(label: "Parts")
    bag = parts |> Keyword.get(:bag)
    [primary, secondary] = bag |> String.split(" ")
    color = "#{primary} #{secondary}"
    # color |> IO.inspect(label: "Color")
    contents = parts |> Keyword.get(:contents)
    inventory = contents |> String.split(", ")
    # inventory |> IO.inspect(label: "Inventory")
    items = for item <- inventory do
      case item |> String.split(" ") do
        [count, item_primary, item_secondary, _] ->
          %{:parent => color, :color => "#{item_primary} #{item_secondary}", :count => String.to_integer(count)}
        [_no, _other, _bags] ->
          %{:parent => color, :color => "no other", :count => 0}
      end
    end
    items |> IO.inspect(label: "Items")
    for %{:parent => parent, :color => color, :count => count} <- items, color != "shiny gold", reduce: 0 do
      sum ->
        parent |> IO.inspect(label: "Parent")
        color |> IO.inspect(label: "Color")
        count |> IO.inspect(label: "Count")
        sum + 1
    end
  end

  def part2(_input) do
  end
end

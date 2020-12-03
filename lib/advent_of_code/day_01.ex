defmodule AdventOfCode.Day01 do
  @number_to_check 2020

  def part1(input) do
    # input |> IO.inspect(label: "Input")
    [{a, b} | _input] = for number_1 <- input, number_2 <- input,
              number_1 + number_2 == @number_to_check,
              do: {number_1, number_2}

    # IO.puts "\nThe sum of two numbers of the list which is equal to #{@number_to_check} is: \{ #{a}, #{b} \}."
    # IO.puts "The multiplication: (#{a} x #{b}) = #{a * b}."

    a * b
  end

  def part2(input) do
    # input |> IO.inspect(label: "Input")
    [{a, b, c} | _input] = for number_1 <- input, number_2 <- input, number_3 <- input,
              number_1 + number_2 + number_3 == @number_to_check,
              do: {number_1, number_2, number_3}

    # IO.puts "\nThe sum of three numbers of the list which is equal to #{@number_to_check} is: \{ #{a}, #{b}, #{c} \}."
    # IO.puts "The multiplication: (#{a} x #{b}) x #{c}) = #{a * b * c}."

    a * b * c
  end
end

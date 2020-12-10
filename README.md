# Advent of Code Elixir Starter

A batteries included starter pack for participating in [Advent of Code](https://www.adventofcode.com) using Elixir!

## Usage

There are 25 modules, 25 tests, and 50 mix tasks.

The modules are responsible for the implementation using inputs.
The tests are responsible for verifying the test cases in the puzzle text are checked.
The mix tasks are responsible for producing the complete output and benchmarking the results.

1. Fill in the tests with the example solution(s) for part 1.
   1. Note: We explicitly make assertions match the test cases given in the puzzle text.
2. Write your implementation.
3. Make sure your test passes by running `mix test`.
4. Fill in the final problem inputs into the mix task and run `mix d01.p1`!
    - Benchmark your solution by passing the `-b` flag, `mix d01.p1 -b`
5. Input the puzzle answer to unlock part 2. Repeat for each day that has multiple parts.

```elixir
defmodule AdventOfCode.Day01 do
  def part1(args) do
  end

  def part2(args) do
  end
end
```

```elixir
defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  @tag :skip # Make sure to remove to run your test.
  test "part1" do
    input = nil
    result = part1(input)

    assert result
  end

  @tag :skip # Make sure to remove to run your test.
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
```

```elixir
defmodule Mix.Tasks.D01.P1 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 1"
  def run(args) do
    input = nil

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end
end
```

## Installation

### Repository Template

1. Click [Use this template](https://github.com/mhanberg/advent-of-code-elixir-starter/generate).
2. Fill in `Repository name`.
3. Fill in `Description` (optional).
4. Choose `Public` or `Private` access.
5. Uncheck `include all branches` as we only care for main.

### Manual

```bash
# clone
$ git clone git@github.com:mhanberg/advent-of-code-elixir-starter.git advent-of-code
$ cd advent-of-code

# Reinitialize your git repo
$ rm -rf .git
$ git init
```

## Puzzles

1. [Day 1](lib/puzzles/day_01.md)
2. [Day 2](lib/puzzles/day_02.md)
3. [Day 3](lib/puzzles/day_03.md)
4. [Day 4](lib/puzzles/day_04.md)
5. [Day 5](lib/puzzles/day_05.md)
6. [Day 6](lib/puzzles/day_06.md)
7. [Day 7](lib/puzzles/day_07.md)
8. [Day 8](lib/puzzles/day_08.md)
9. [Day 9](lib/puzzles/day_09.md)
10. [Day 10](lib/puzzles/day_10.md)
11. [Day 11](lib/puzzles/day_11.md)
12. [Day 12](lib/puzzles/day_12.md)
13. [Day 13](lib/puzzles/day_13.md)
14. [Day 14](lib/puzzles/day_14.md)
15. [Day 15](lib/puzzles/day_15.md)
16. [Day 16](lib/puzzles/day_16.md)
17. [Day 17](lib/puzzles/day_17.md)
18. [Day 18](lib/puzzles/day_18.md)
19. [Day 19](lib/puzzles/day_19.md)
20. [Day 20](lib/puzzles/day_20.md)
21. [Day 21](lib/puzzles/day_21.md)
22. [Day 22](lib/puzzles/day_22.md)
23. [Day 23](lib/puzzles/day_23.md)
24. [Day 24](lib/puzzles/day_24.md)
25. [Day 25](lib/puzzles/day_25.md)

## Journal

1. [Day 1](lib/journal/day_01.md)
2. [Day 2](lib/journal/day_02.md)
3. [Day 3](lib/journal/day_03.md)
4. [Day 4](lib/journal/day_04.md)
5. [Day 5](lib/journal/day_05.md)
6. [Day 6](lib/journal/day_06.md)
7. [Day 7](lib/journal/day_07.md)
8. [Day 8](lib/journal/day_08.md)
9. [Day 9](lib/journal/day_09.md)
10. [Day 10](lib/journal/day_10.md)
11. [Day 11](lib/journal/day_11.md)
12. [Day 12](lib/journal/day_12.md)
13. [Day 13](lib/journal/day_13.md)
14. [Day 14](lib/journal/day_14.md)
15. [Day 15](lib/journal/day_15.md)
16. [Day 16](lib/journal/day_16.md)
17. [Day 17](lib/journal/day_17.md)
18. [Day 18](lib/journal/day_18.md)
19. [Day 19](lib/journal/day_19.md)
20. [Day 20](lib/journal/day_20.md)
21. [Day 21](lib/journal/day_21.md)
22. [Day 22](lib/journal/day_22.md)
23. [Day 23](lib/journal/day_23.md)
24. [Day 24](lib/journal/day_24.md)
25. [Day 25](lib/journal/day_25.md)

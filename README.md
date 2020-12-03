# Advent of Code Elixir Starter

A batteries included starter pack for participating in [Advent of Code](https://www.adventofcode.com) using Elixir!

## Usage

There are 25 modules, 25 tests, and 50 mix tasks.

The modules are responsible for the implementation using inputs.
The tests are responsible for verifying the test cases in the puzzle text are checked.
The mix tasks are responsible for producing the complete output and benchmarking the results.

1. Fill in the tests with the example solutions.
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

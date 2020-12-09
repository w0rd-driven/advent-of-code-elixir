# Journal Entry, December 9th 2020 (Wednesday)

## Part 1

Looks like I have the bright idea of starting this **before** I start the puzzle as things could easily change. This is the first time I've changed the boilerplate to pass in the input with the `preamble_length` so we can specify 5 (during tests) or default to 25 when not present (normal day tasks). Elixir has a split method that we use as `{ preamble, message } = input |> Enum.split(preamble_length)` to split the total input into the preamble (1st 25 values) and the message (tail). From here we loop through the message list once but loop through the preamble twice, gathering values by separate index. We have to make sure both values are unique or we continue the loop until we finish. If nothing in the preamble sums to that number, add it to the list. We should stop after the first is found but there may be a benefit to building a complete list and returning the first result.

## Part 2

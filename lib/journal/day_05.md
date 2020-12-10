# Journal Entry, December 5th 2020 (Saturday)

## Part 1

This one was difficult for me to reason about but I don't think I gave myself enough time tbh. I used the approach from [here](https://github.com/Maximization/adventofcode2020/blob/main/day5/index.js) to implement `new_range`. It still took a fair amount of time to work out how to turn that into a version for Elixir. I did come up with some similar pieces though. I knew we needed to take the half value and split in a binary fashion but my implementation tried using a case statement to check both values. I had run into issues with the column parsing because I incorrectly put the bounds as `0, 8` and not `0, 7` as they should be.

The implementation is a little confusing due to my incessant use of a duplicate function of part1 to pass the input into directly. I took a different approach here finally but we call `parse_seats` that is responsible for returning a list of seat ids. For each seat we parse by splitting at the 7th character, splitting each into graphemes then tupling the `parse_row` and `parse_column` functions.

`parse_row` builds a list from 0 to 127 then uses `Enum.reduce` to call our `new_range` function with our conditional (`char == "F"` or `char == "L"`) to determine when to keep the lower result. The `new_range` function determines a new upper and lower bounds then returns that as a list of `[new_lower, new_upper]` for re-entry into the anonymous function invoked by `Enum.reduce`. From here we have a list of seat ids and we do a crude `Enum.max` to get the highest value.

## Part 2

Initially this stumped me too and I had looked to implement the approach for step 2 [here](https://github.com/Maximization/adventofcode2020/blob/main/day5/index.js) but ran into issues quickly. I then took a step back and realized I could reuse some similar approaches taken earlier, namely to build a list of valid seats to check against. By looking at the min and max returned from the dataset, we adhere to the statement `However, there's a catch: some of the seats at the very front and back of the plane don't exist on this aircraft, so they'll be missing from your list as well.`.

For our implementation, we parse the same input from part 1 but this time we sort the list to be certain things are in order before proceeding. We first get the first id in the list, this is the lowest seat used. We perform the same calculation from part 1, `Enum.max` to get the highest seat id. From here we build a list from `min..max` to give us **all possible seats** and use `MapSet.difference` to determine the difference between the list of all possible seats and the list we parsed from part 1, giving us a list of a single missing seat id.

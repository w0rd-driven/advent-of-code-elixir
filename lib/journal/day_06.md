# Journal Entry, December 6th 2020 (Sunday)

## Part 1

This is one of the few puzzles that I could implement entirely on my own. Initially, I thought splitting answers down to individual graphemes would be a useful approach but realized it would be easier to join strings (took forever to Google that `Enum.join` is the approach to take). From here we split to graphemes, dedupe the list of characters via `Enum.uniq`, then do a crude grapheme (I'm using this word a ton to keep it in memory) count. From there we sum the results of the list of character counts to get our test and we got the answer on the first try.

## Part 2

This took a minute to work out that we needed to count passengers to gather the answers all of them answered. When the list is just a single string, we do the same character count as before because whether they answer 3 or 500, the number will always be the same. When the list is a list of answers, we join into an individual string and use the same character count method from day 2 to return a map of characters and their counts. With the character count map we iterate over it using `Enum.reduce` to sum an accumulator. It's possible `Enum.count` would work here since the accumulation is straightforward. After literally writing that sentence, I refactored to use `Enum.count` and I think it looks a little cleaner. It's good to understand `Enum.reduce` though because this is the closest way to get to a traditional `for` loop with an index.

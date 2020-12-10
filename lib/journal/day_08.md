# Journal Entry, December 8th 2020 (Tuesday)

## Part 1

I understood the problem immediately thankfully and knew that the solution would come from keeping a list of checked/seen indexes to notice when the infinite loop hits. I saw Donald Hutchison's solution [here](https://github.com/rkachowski/advent-of-code/blob/master/2020/8/solution.exs) that I pretty much stole verbatim as I had issues working out how to accumulate the data correctly.

In spite of cheating (this is more than just a hint), I at least worked out how to get the case statement instead of gated function calls.

Our solution uses recursive function calls to accumulate a tuple of data as `{index, acc, seen}` we gate for when the index jumps outside of the length of our instruction set, which means the loop ended. For all other iterations, we look at our seen map to see if an index is present and if it is immediately return `{:loop, {index, acc, seen}}` to show we've hit the infinite loop. If the index is not present we do a case check to look for the `nop`, `acc`, or `jmp` instructions. If it's a `nop`, we increment the index and re-enter the function with the same accumulator. If it's a `acc`, we increment the index and add the value of the instruction to the accumulator. If it's a `jmp`, we add the index to the instruction value and re-enter until we reach the `:loop` or `:end`.

## Part 2

I straight up reused [this solution](https://github.com/rkachowski/advent-of-code/blob/master/2020/8/solution.exs) as by this point in the day my brain was fried even from just implementing someone else's solution.

I do want to take another second to mention how this feels and will try to put it into a centralized location to explain further. I remember giving myself outs towards the start of this and internally I seem on the fence. I learned a **TON** by actually implementing this solution versus just looking at it and unfortunately I couldn't tell if it was correct until submitting an answer. I should probably try to shop this around but I do know exercism exercises are much harder for me to reason about, and there's momentum in the progression. I think the biggest hurdle is finding solutions to this is seemingly easy though exercism is too. Because I'm still on the fence though, I may give myself one more out. Like for instance, I'm not going back to day 7 yet until I can apply this knowledge.

This is also changing the course of these journal entries from just how I feel to trying to explain the solution. If I can explain the solution and be correct (by the correct answer), I feel like this is a worthwhile endeavor for even the heavy cheat days. I do consider these training wheels and at some point I do need to lose them.

Sorry for the divergence. Like part 1, we parse the input for instructions. We build a `modifiable` list of indexes reduced down from our input that for our test case results in `[7, 4, 2, 0]`. From here, we run `brute_force` with our `modifiable` list and `instructions` that recursively modifies a single instruction in the list by index to change the `jmp` to a `nop` or a `nop` to a `jmp` then performs the **same check for part 1**. If a loop is found, re-enter `brute_force` with `[4, 2, 0]` from our example until `:end` is reached or `modifiable` is empty (I think this is the same thing).

# ExSubsetSum

based on https://panduwana.wordpress.com/2010/04/21/combination-in-erlang/

## Description

See [here](https://elixirforum.com/t/sum-of-subsets/50511/33)

## Example

```elixir
iex> ExSubsetSum.sum_of_one(Enum.to_list(1..10), 10)
[
  [10],
  [1, 9],
  [2, 8],
  [3, 7],
  [4, 6],
  [1, 2, 7],
  [1, 3, 6],
  [1, 4, 5],
  [2, 3, 5],
  [1, 2, 3, 4]
]

iex> ExSubsetSum.sum_of_all(Enum.to_list(1..10), [1, 4, 5])
[
  [10],
  [1, 9],
  [2, 8],
  [3, 7],
  [4, 6],
  [1, 2, 7],
  [1, 3, 6],
  [1, 4, 5],
  [2, 3, 5],
  [1, 2, 3, 4]
]
```

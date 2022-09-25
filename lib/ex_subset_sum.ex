defmodule SubsetSum do
  # see https://panduwana.wordpress.com/2010/04/21/combination-in-erlang/

  def valid_sum([]), do: []

  def valid_sum(list) when is_list(list) do
    Enum.filter(list, fn element -> is_integer(element) and element > 0 end)
  end

  def sum_of_one(list, provided_integer_sum, list_sanitizer \\ &valid_sum/1)
  def sum_of_one([], _, _), do: []

  def sum_of_one(list, provided_integer_sum, list_sanitizer) do
    sanitized_list = list_sanitizer.(list)
    combinations = _combinations(sanitized_list)

    Enum.filter(
      combinations,
      fn e -> List.flatten(e) |> Enum.sum() == provided_integer_sum end
    )
  end

  defp _combinations(list) do
    List.foldl(
      Enum.to_list(1..length(list)),
      [],
      fn length, acc -> acc ++ _combinations(list, length) end
    )
  end

  def c(list) do
    List.foldl(
      Enum.to_list(1..length(list)),
      [],
      fn length, acc -> acc ++ _combinations(list, length) end
    )
  end

  defp _combinations(list, 1), do: for(e <- list, do: [e])

  defp _combinations(list, length) when length(list) == length, do: [list]

  defp _combinations([h | t], length) do
    for(sub_sum <- _combinations(t, length - 1), do: [h | sub_sum]) ++ _combinations(t, length)
  end

  def sum_of_all(list, matrix_2d, list_sanitizer \\ &valid_sum/1) do
    calculated_integer_sum = list_sanitizer.(matrix_2d) |> Enum.sum()
    sum_of_one(list, calculated_integer_sum)
  end
end

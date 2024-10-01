#https://leetcode.com/problems/two-sum/?source=submission-ac

defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    {result, _} =
      Enum.reduce_while(Enum.with_index(nums), {[], %{}}, fn {num, index}, {_, map} ->
        complement = target - num
        cond do
          Map.has_key?(map, complement) ->
            {:halt, {[map[complement], index], map}}
          true ->
            {:cont, {[], Map.put_new(map, num, index)}}
        end
      end)
    result
  end
end

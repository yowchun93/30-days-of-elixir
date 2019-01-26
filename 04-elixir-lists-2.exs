ExUnit.start

defmodule MyList do

  # Exercise: From programming Elixir by DaveThomas
  # Write a mapsum function that takes a list and a function. It applies the function
  # to each element of the list and sums the result.
  def mapsum( list, func) do
    sum(list, 0, func)
  end

  def sum([head|tail], acum, func) do
    sum(tail, acum + func.(head, head), func)
  end

  def sum([], acum, _func) do
    acum
  end

  def max(list) do
    max(list, nil)
  end

  defp _max([head|tail], current_max=nil) do
    max(tail, head)
  end

  defp _max([head|tail], current_max) do
    current_max
  end

  defp _max([head|tail], current_max) when head >= current_max do
    max(tail, head)
  end

  defp _max([head|tail], current_max) when head < current_max do
    max(tail, current_max)
  end

end

defmodule ListTest do
  use ExUnit.Case

  test "mapsum sums the result" do
    MyList.mapsum([1,2,3], fn(a,b) -> a*b end)
  end

  test "max in list" do
    MyList.max([1,2,3]) == 3
  end


end

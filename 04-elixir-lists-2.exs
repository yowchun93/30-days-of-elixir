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

end

defmodule ListTest do
  use ExUnit.Case

  test "mapsum sums the result" do
    MyList.mapsum([1,2,3], fn(a,b) -> a*b end)
  end


end

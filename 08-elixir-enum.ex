ExUnit.start

defmodule MyEnum do

  def all?([], _fun) do
    true
  end

  def all?([head|tail], func) do
    if func.(head) do
      all?(tail, func)
    else
      false
    end
  end

  def each([], _func) do
    :ok
  end

  def each([head|tail], func) do
    func.(head)
    each(tail, func)
    :ok
  end

  def filter([], func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      # elixir always returns a new list, instead of mutating the original list
      [ head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def take(list, n) do
    _take([], list, n)
  end

  def _take(result, [], _) do
    []
  end

  def _take(result, [head|tail], n) do
    _take([head|result], tail, n-1)
  end

  def _take(result, _, 0) do
    result
  end

end

defmodule EnumTest do
  use ExUnit.Case

  test "Enum.all true" do
    MyEnum.all?([2,2], fn(x) -> x*x == 4 end) == true
  end

  test "Enum.all false" do
    MyEnum.all?([2,3], fn(x) -> x*x == 4 end) == false
  end

  test "Enum each" do
    MyEnum.each([2,3], &IO.puts/1) == :ok
  end

  test "Enum filter" do
    MyEnum.filter([2,3,6], fn(x) -> rem(x,3) == 0 end) == [3,6]
  end

end



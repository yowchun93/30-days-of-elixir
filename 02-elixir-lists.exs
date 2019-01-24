ExUnit.start

defmodule ListSample do

  def len([]) do
    0
  end

  def len([_head|tail]) do
    1 + len(tail)
  end

  def square([]) do
    []
  end

  def square([head|tail]) do
    [head*2 | square(tail)]
  end

  def add_1([]) do
    []
  end

  def add_1([head|tail]) do
    [1+head | add_1(tail)]
  end

  def map([]) do
    []
  end

  def map([head|tail], func) do
    [func.(head)|tail]
  end

  def sum([]) do
    0
  end

  def sum([head|tail]) do
    head + sum(tail)
  end

  def reduce([], value, _func) do
    value
  end

  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

end

defmodule ListTest do
  use ExUnit.Case

  test "pattern matching" do
    [a,b,c] = [1,2,3]
    assert a == 1
    assert b == 2
  end

  test "head" do
    [head|tail] = [1,2,3]
    assert head == 1
  end

  test "tail" do
    [head|tail] = [1,2,3]
    assert tail == [2,3]
  end

  test "calculating length of list using recursion" do
    ListSample.len([1,2,3]) == 3
  end

  test "calculating square of list using recursion" do
    ListSample.square([2,3,4]) == [4,9,16]
  end

  test "add 1 to list" do
    ListSample.square([2,3]) == [3,4]
  end

  test "map function, double the value" do
    ListSample.map([2], fn(n) -> n*n end) == [4]
  end

  test "map function, adding 1 to the value" do
    ListSample.map([2,3], fn(n) -> n+1 end) == [3,4]
  end

  test "map function, using shortcut annotation" do
    ListSample.map([2,3], &(&1 + 1)) == [3,4]
  end

  test "reduce function" do
    ListSample.reduce([1,2], 0, fn(a,b) -> a+b end) == 3
  end

  test "reduce multiply function" do
    ListSample.reduce([1,2,3], 0, fn(a,b) -> a*b end) == 6
  end
end



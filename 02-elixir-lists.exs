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
end



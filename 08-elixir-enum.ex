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

  ## not tail optimized
  def each([], _func) do
    :ok
  end

  def each([head|tail], func) do
    func.(head)
    each(tail, func)
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
    MyEnum.each([2,3], fn(x) -> x*x end) == [4,9]
  end

end



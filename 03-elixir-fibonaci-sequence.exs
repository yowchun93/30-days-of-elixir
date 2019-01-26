defmodule Fib do

  def getNumber(0), do: 0
  def getNumber(1), do: 1

  # def getNumber(n) when n < 0, do: raise "You're trying to find a Fibonacci Number under Zero. Please try again."
  def getNumber(n) do
    getNumber(n-2) + getNumber(n-1)
  end

  ## tail recursion
  def fib(n), do: fib(n, 0, 1)

  def fib(0, acc, _), do: acc

  def fib(n, acc, cur) do
    fib(n - 1, cur, acc + cur)
  end

end

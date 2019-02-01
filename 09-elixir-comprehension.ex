ExUnit.start
defmodule MyComprehension do
  def example do
    for x <- [1,2,3,4,5] do
      x * x
    end
  end

  def weather do
    reports = [ kl: :hot, thailand: :cold, singapore: :muggy]
    for {city, weather} <- reports, do: {weather, city}
  end
end

defmodule MyComprehensionTest do
  use ExUnit.Case

  test "comprehension" do
    assert MyComprehension.example == [1,4,9,16,25]
  end

  test "reports" do
    assert MyComprehension.weather == [hot: :kl, cold: :thailand, muggy: :singapore]
  end
end

ExUnit.start

defmodule MyMap do

  ## pattern matching and updating maps
  ## to check if there is an entry

  # person = %{name: "Dave", height: 1.88}
  # %{name: a_name} = person
  # %{name: "Dave"} = person -> %{name: "Dave", height: 1.88 }
  # %{name: "David"} = person -> no match
  def match do

  end

  def update_map(map, entry=%{name: value}) do
    new_map = %{ map | name: value }
  end

  ## Updating Nested Maps

end


defmodule MapTest do
  use ExUnit.Case

  test "updating map" do
    MyMap.update_map(%{name: "David"}, %{name: "Ali"}) == %{name: "Ali"}
  end

end

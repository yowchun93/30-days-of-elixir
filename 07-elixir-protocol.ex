ExUnit.start
# A really good talk about Protocols in Elixir
# https://www.youtube.com/watch?v=sJvfCE6PFxY

defprotocol Blankable do
  def blank?(term)
end

defimpl Blankable, for: BitString do
  def blank?(""), do: true
  def blank?(_), do: false
end

defimpl Blankable, for: Map do
  def blank?(map), do: map_size(map) == 0
end

defmodule Post do
  defstruct [:title, :body]

  defimpl Blankable do
    def blank?(%{body: nil}), do: true
    def blank?(%{body: _}), do: true
  end
end


defmodule PostTest do
  use ExUnit.Case
  test "post without body is blank" do
    post = %Post{title: "haha", body: ""}
    Blankable.blank?(post) == true
  end

  test "post with body is not blank" do
    post = %Post{title: "haha", body: ""}
    Blankable.blank?(post) == false
  end
end

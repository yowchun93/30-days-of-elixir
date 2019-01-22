#https://hexdocs.pm/elixir/Map.html

## using Map to imitate a todo list
defmodule Todo do

  defstruct entries: %{}, auto_id: 1

  def new, do: %Todo{}

  # Map.put
  # https://hexdocs.pm/elixir/Map.html#put/3
  def add_entry(list, entry=%{action: _ }) do
    new_entries = Map.put(list.entries, list.auto_id, entry)
    %Todo{entries: new_entries, auto_id: list.auto_id + 1}
  end

  # Map.get
  # https://hexdocs.pm/elixir/Map.html#get/3
  def get_entry(list, id) do
    Map.fetch(list.entries, id)
  end

  # Map.put
  # https://hexdocs.pm/elixir/Map.html#put/3
  # Map is immutable, so the result of the update is a new map
  def update_entry(list, id, entry=%{action: _ }) do
    new_entries = Map.put(list.entries, id, entry)
    %Todo{list | entries: new_entries}
  end

end

defmodule CoffeeBreak737.SearchByActiveLength do
  @enforce_keys [:how_long, :until]
  defstruct [:how_long, :until]

  @type t :: %__MODULE__{how_long: non_neg_integer(), until: non_neg_integer()}

  @spec new(how_long :: non_neg_integer(), until :: non_neg_integer()) :: __MODULE__.t()
  def new(how_long, until), do: %__MODULE__{how_long: how_long, until: until}
end

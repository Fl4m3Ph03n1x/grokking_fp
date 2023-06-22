defmodule Chapter736.SearchByActiveYears do
  @enforce_keys [:start, :end]
  defstruct [:start, :end]

  @type t :: %__MODULE__{start: non_neg_integer(), end: non_neg_integer()}

  @spec new(start_year :: non_neg_integer(), end_year :: non_neg_integer()) :: __MODULE__.t()
  def new(start_year, end_year), do: %__MODULE__{start: start_year, end: end_year}
end

defmodule CoffeeBreak737.StillActive do
  alias CoffeeBreak737.PeriodInYears

  @enforce_keys [:since, :previous_periods]
  defstruct [:since, :previous_periods]

  @type t :: %__MODULE__{since: non_neg_integer(), previous_periods: [PeriodInYears]}

  @spec new(since :: non_neg_integer(), previous_periods :: [PeriodInYears]) :: __MODULE__.t()
  def new(since, previous_periods),
    do: %__MODULE__{since: since, previous_periods: previous_periods}

  @spec new(since :: non_neg_integer()) :: __MODULE__.t()
  def new(since), do: %__MODULE__{since: since, previous_periods: []}
end

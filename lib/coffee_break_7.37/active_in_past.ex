defmodule CoffeeBreak737.ActiveInPast do
  alias CoffeeBreak737.PeriodInYears

  @enforce_keys [:periods]
  defstruct [:periods]

  @type t :: %__MODULE__{periods: [PeriodInYears]}

  @spec new(periods :: [PeriodInYears]) :: __MODULE__.t()
  def new(periods), do: %__MODULE__{periods: periods}
end

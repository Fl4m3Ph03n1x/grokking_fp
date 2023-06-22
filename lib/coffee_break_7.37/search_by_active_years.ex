defmodule CoffeeBreak737.SearchByActiveYears do
  alias CoffeeBreak737.PeriodInYears

  @enforce_keys [:period]
  defstruct [:period]

  @type t :: %__MODULE__{period: PeriodInYears.t()}

  @spec new(period :: PeriodInYears.t()) :: __MODULE__.t()
  def new(period), do: %__MODULE__{period: period}
end

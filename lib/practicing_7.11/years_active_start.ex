defmodule Practicing711.YearsActiveStart do
  defstruct [:value]

  @type t :: %__MODULE__{value: non_neg_integer()}

  @spec new(value :: non_neg_integer()) :: __MODULE__.t()
  def new(value), do: %__MODULE__{value: value}
end

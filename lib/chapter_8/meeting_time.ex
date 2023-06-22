defmodule Chapter8.MeetingTime do
  @enforce_keys [:start_hour, :end_hour]
  defstruct [:start_hour, :end_hour]

  @type t :: %__MODULE__{start_hour: non_neg_integer(), end_hour: non_neg_integer()}

  @spec new(start_hour :: non_neg_integer(), end_hour :: non_neg_integer()) :: __MODULE__.t()
  def new(start_hour, end_hour), do: %__MODULE__{start_hour: start_hour, end_hour: end_hour}
end

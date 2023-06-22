defmodule Practicing729.StillActive do
  @enforce_keys [:since]
  defstruct [:since]

  @type t :: %__MODULE__{since: non_neg_integer()}

  @spec new(since :: non_neg_integer()) :: __MODULE__.t()
  def new(since), do: %__MODULE__{since: since}
end

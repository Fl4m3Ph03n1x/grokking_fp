defmodule Chapter736.SearchByOrigin do
  alias Chapter736.Location

  @enforce_keys [:location]
  defstruct [:location]

  @type t :: %__MODULE__{location: Location.t()}

  @spec new(location :: Location.t()) :: __MODULE__.t()
  def new(location), do: %__MODULE__{location: location}
end

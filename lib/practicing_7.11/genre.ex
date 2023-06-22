defmodule Practicing711.Genre do
  defstruct [:name]

  @type t :: %__MODULE__{name: String.t()}

  @spec new(name :: String.t()) :: __MODULE__.t()
  def new(name), do: %__MODULE__{name: name}
end

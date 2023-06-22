defmodule CoffeeBreak534.Event do
  @enforce_keys [:name, :start, :end]
  defstruct [:name, :start, :end]

  @type t :: %__MODULE__{
          name: String.t(),
          start: integer(),
          end: integer()
        }
end

defmodule CoffeeBreak57.Book do
  @enforce_keys [:title, :authors]
  defstruct [:title, :authors]

  @type t :: %__MODULE__{
          title: String.t(),
          authors: [String.t()]
        }
end

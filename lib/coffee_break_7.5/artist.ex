defmodule CoffeeBreak75.Artist do
  alias Location
  defstruct [:name, :genre, :origin, :is_active, :years_active_start, :years_active_end]

  @type t :: %__MODULE__{
          name: String.t(),
          genre: String.t(),
          origin: Location.t(),
          is_active: boolean(),
          years_active_start: non_neg_integer(),
          years_active_end: non_neg_integer()
        }

  @spec new(
          name :: String.t(),
          genre :: String.t(),
          origin :: Location.t(),
          is_active :: boolean(),
          years_active_start :: non_neg_integer(),
          years_active_end :: non_neg_integer()
        ) :: __MODULE__.t()
  def new(name, genre, origin, is_active, years_active_start, years_active_end) do
    %__MODULE__{
      name: name,
      genre: genre,
      origin: origin,
      is_active: is_active,
      years_active_start: years_active_start,
      years_active_end: years_active_end
    }
  end
end

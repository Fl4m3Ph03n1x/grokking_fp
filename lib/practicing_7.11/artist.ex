defmodule Practicing711.Artist do
  alias Practicing711.{Genre, Location, YearsActiveEnd, YearsActiveStart}

  defstruct [:name, :genre, :origin, :is_active, :years_active_start, :years_active_end]

  @type t :: %__MODULE__{
          name: String.t(),
          genre: Genre.t(),
          origin: Location.t(),
          is_active: boolean(),
          years_active_start: YearsActiveStart.t(),
          years_active_end: YearsActiveEnd.t()
        }

  @spec new(
          name :: String.t(),
          genre :: Genre.t(),
          origin :: Location.t(),
          is_active :: boolean(),
          years_active_start :: YearsActiveStart.t(),
          years_active_end :: YearsActiveEnd.t()
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

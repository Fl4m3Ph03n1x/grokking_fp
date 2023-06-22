defmodule CoffeeBreak737.Artist do
  alias CoffeeBreak737.{Location, ActiveInPast, StillActive}

  @enforce_keys [:name, :genre, :origin, :years_active]
  defstruct [:name, :genre, :origin, :years_active]

  @type years_active :: ActiveInPast.t() | StillActive.t()
  @type genre :: :hard_rock | :heavy_metal | :pop

  @type t :: %__MODULE__{
          name: String.t(),
          genre: genre,
          origin: Location.t(),
          years_active: years_active
        }

  @spec new(
          name :: String.t(),
          genre :: genre,
          origin :: Location.t(),
          years_active :: years_active()
        ) :: __MODULE__.t()
  def new(name, genre, origin, years_active) do
    %__MODULE__{
      name: name,
      genre: genre,
      origin: origin,
      years_active: years_active
    }
  end
end

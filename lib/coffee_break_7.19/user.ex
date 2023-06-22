defmodule CoffeeBreak719.User do
  defstruct [:name, :city, :favorite_artists]

  @type t :: %__MODULE__{
          name: String.t(),
          city: Option.t(String.t()),
          favorite_artists: [String.t()]
        }

  @spec new(name :: String.t(), city :: Option.t(String.t()), favorite_artists :: [String.t()]) ::
          __MODULE__.t()
  def new(name, city, favorite_artists),
    do: %__MODULE__{name: name, city: city, favorite_artists: favorite_artists}
end

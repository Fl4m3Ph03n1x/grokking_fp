defmodule CoffeeBreak737.SearchByGenre do
  defstruct [:name]

  @type genre :: :hard_rock | :heavy_metal | :pop
  @type t :: %__MODULE__{name: genre}

  @spec new(name :: genre) :: __MODULE__.t()
  def new(name), do: %__MODULE__{name: name}
end

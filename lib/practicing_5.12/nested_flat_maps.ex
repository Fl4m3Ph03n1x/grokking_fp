defmodule NestedFlatMaps do
  alias Point

  @spec exercise :: [Point.t()]
  def exercise do
    Enum.flat_map(
      [1],
      fn x -> Enum.map([-2, 7], fn y -> %Point{x: x, y: y} end) end
    )
  end
end

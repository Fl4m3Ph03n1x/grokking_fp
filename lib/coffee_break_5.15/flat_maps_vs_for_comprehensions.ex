defmodule CoffeeBreak515.FlatMapsVSForComprehensions do
  alias CoffeeBreak515.{Point, Point3D}

  @spec exercise :: [Point.t()]
  def exercise do
    for x <- [1],
        y <- [2, -7] do
      %Point{x: x, y: y}
    end
  end

  @spec exercise_2 :: [Point3D.t()]
  def exercise_2 do
    for x <- [1],
        y <- [-2, 7],
        z <- [3, 4] do
      %Point3D{x: x, y: y, z: z}
    end
  end
end

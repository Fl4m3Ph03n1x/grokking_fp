defmodule CoffeeBreak515.Point3D do
  @enforce_keys [:x, :y, :z]
  defstruct [:x, :y, :z]

  @type t :: %__MODULE__{
          x: integer(),
          y: integer(),
          z: integer()
        }
end

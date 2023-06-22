defmodule TvShow do
  @enforce_keys [:name, :year_start, :year_end]
  defstruct [:name, :year_start, :year_end]

  @type t :: %__MODULE__{
          name: integer(),
          year_start: integer(),
          year_end: integer()
        }
end

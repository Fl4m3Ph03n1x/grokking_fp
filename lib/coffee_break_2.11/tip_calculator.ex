defmodule CoffeeBreak211.TipCalculator do
  @moduledoc """
  Coffee Break for section 2.11: Refactoring to a pure function.

  Convert a piece of imperative code into functional.
  """

  @spec add_person([String.t()], String.t()) :: [String.t()]
  def add_person(names, new_name), do: [new_name | names]

  @spec get_tip_percentage([String.t()]) :: non_neg_integer()
  def get_tip_percentage(names) do
    names_size = length(names)

    cond do
      names_size > 5 -> 20
      names_size > 0 -> 10
      true -> 0
    end
  end
end

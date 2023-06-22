defmodule PracticingCurrying do
  @moduledoc """
  Exercises from chapter 4 - 4.50 Practicing Currying
  """

  # use Currying

  @spec greater_than(integer()) :: (integer() -> bool())
  def greater_than(min) do
    fn number -> number > min end
  end

  # def greater_than(min, number) do
  #   number > min
  # end
end

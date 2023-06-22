defmodule CoffeeBreak315.ImmutableValues do
  @moduledoc """
  Exercises from chapter 3 - Immutable Values
  """

  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(name) do
    [first_name | last_names] = String.split(name, " ")
    "#{String.first(first_name)}. #{last_names}"
  end

  @spec first_two([String.t()]) :: [String.t()]
  def first_two([first, second | _tail]), do: [first, second]

  @spec last_two([String.t()]) :: [String.t()]
  def last_two(list) do
    [last, penultimate | _tail] = Enum.reverse(list)
    [penultimate, last]
  end

  @spec moved_first_two_to_the_end([String.t()]) :: [String.t()]
  def moved_first_two_to_the_end([first, second | tail]), do: tail ++ [first, second]

  @spec inserted_before_last([String.t()], String.t()) :: [String.t()]
  def inserted_before_last(list, elem) do
    [last | body] = Enum.reverse(list)
    body ++ [elem, last]
  end
end

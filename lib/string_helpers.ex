defmodule StringHelpers do
  alias ListHelpers

  @spec index_of(String.t(), String.t()) :: integer
  def index_of(str, elem),
    do:
      str
      |> String.codepoints()
      |> ListHelpers.index_of(elem)

  @spec to_int_maybe(String.t()) :: Option.t(integer)
  def to_int_maybe(val) do
    case Integer.parse(val) do
      {num, ""} -> Option.new(num)
      _error -> Option.new()
    end
  end
end

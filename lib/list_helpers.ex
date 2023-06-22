defmodule ListHelpers do
  @spec index_of([any], any) :: integer
  def index_of(list, elem), do: search(list, elem, 0)

  @spec search([any], any, integer) :: integer
  defp search([], _elem, _index), do: -1

  defp search([head | tail], elem, index) do
    if head == elem do
      index
    else
      search(tail, elem, index + 1)
    end
  end
end

defmodule Chapter736.FunctionsWithADTBasedParameters do
  alias Chapter736.{
    Artist,
    Location,
    StillActive,
    ActiveBetween,
    SearchByGenre,
    SearchByOrigin,
    SearchByActiveYears
  }

  @type search_condition :: SearchByGenre | SearchByOrigin | SearchByActiveYears

  @spec generate_artists :: [Artist.t()]
  def generate_artists do
    [
      Artist.new(
        "Metallica",
        :heavy_metal,
        Location.new("U.S."),
        StillActive.new(1981)
      ),
      Artist.new(
        "Led Zeppelin",
        :hard_rock,
        Location.new("England"),
        ActiveBetween.new(1968, 1980)
      ),
      Artist.new(
        "Bee Gees",
        :pop,
        Location.new("England"),
        ActiveBetween.new(1958, 2003)
      )
    ]
  end

  @spec search_artists(artists :: [Artist.t()], conditions :: [search_condition]) :: [Artist.t()]
  def search_artists(artists, conditions) do
    Enum.filter(artists, fn artist -> Enum.all?(conditions, &obeys_condition?(&1, artist)) end)
  end

  @spec obeys_condition?(condition :: search_condition(), artist :: Artist.t()) :: boolean()
  defp obeys_condition?(%SearchByGenre{name: genre}, artist), do: artist.genre == genre
  defp obeys_condition?(%SearchByOrigin{location: origin}, artist), do: artist.origin == origin

  defp obeys_condition?(%SearchByActiveYears{start: start_year}, %Artist{
         years_active: %StillActive{since: since}
       }),
       do: since >= start_year

  defp obeys_condition?(%SearchByActiveYears{start: start_year, end: end_year}, %Artist{
         years_active: %ActiveBetween{start: artist_start, end: artist_end}
       }),
       do: artist_start >= start_year and artist_end <= end_year
end

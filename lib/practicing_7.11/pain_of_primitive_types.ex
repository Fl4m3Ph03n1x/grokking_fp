defmodule Practicing711.PainOfPrimitiveTypes do
  alias Practicing711.{Artist, Location, Genre, YearsActiveEnd, YearsActiveStart}

  @spec generate_artists :: [Artist.t()]
  def generate_artists do
    [
      %Artist{
        name: "Metallica",
        genre: Genre.new("Heavy Metal"),
        origin: Location.new("U.S."),
        is_active: true,
        years_active_start: YearsActiveStart.new(1981),
        years_active_end: YearsActiveEnd.new(0)
      },
      %Artist{
        name: "Led Zeppelin",
        genre: Genre.new("Hard Rock"),
        origin: Location.new("England"),
        is_active: false,
        years_active_start: YearsActiveStart.new(1968),
        years_active_end: YearsActiveEnd.new(1980)
      },
      %Artist{
        name: "Bee Gees",
        genre: Genre.new("Pop"),
        origin: Location.new("England"),
        is_active: false,
        years_active_start: YearsActiveStart.new(1958),
        years_active_end: YearsActiveEnd.new(2003)
      }
    ]
  end

  @spec search_artists(
          artists :: [Artist.t()],
          genres :: [String.t()],
          locations :: [String.t()],
          search_by_active_years :: boolean(),
          active_after :: non_neg_integer(),
          active_before :: non_neg_integer()
        ) :: [Artist.t()]
  def search_artists(
        artists,
        genres,
        locations,
        search_by_active_years,
        active_after,
        active_before
      ) do
    artists
    |> Enum.filter(&by_genres(&1, genres))
    |> Enum.filter(&by_locations(&1, locations))
    |> Enum.filter(&by_active_years(&1, search_by_active_years, active_after, active_before))
  end

  @spec by_genres(Artist.t(), [String.t()]) :: boolean()
  defp by_genres(_artist, []), do: true
  defp by_genres(artist, genres), do: artist.genre.name in genres

  @spec by_locations(Artist.t(), [String.t()]) :: boolean()
  defp by_locations(_artist, []), do: true
  defp by_locations(artist, locations), do: artist.origin.name in locations

  @spec by_active_years(Artist.t(), boolean(), non_neg_integer(), non_neg_integer()) :: boolean
  defp by_active_years(_artist, false, _active_after, _active_before), do: true

  defp by_active_years(artist, _search_by_active_years, active_after, active_before) do
    cond do
      not artist.is_active and artist.years_active_start.value >= active_after and
          artist.years_active_end.value <= active_before ->
        true

      artist.is_active and artist.years_active_start.value >= active_after ->
        true

      true ->
        false
    end
  end
end

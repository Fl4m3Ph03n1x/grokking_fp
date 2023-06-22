defmodule CoffeeBreak737.DesignAndMaintainability do
  alias CoffeeBreak737.{
    Artist,
    Location,
    StillActive,
    ActiveInPast,
    SearchByGenre,
    SearchByOrigin,
    SearchByActiveYears,
    SearchByActiveLength,
    PeriodInYears
  }

  @type search_condition ::
          SearchByGenre | SearchByOrigin | SearchByActiveYears | SearchByActiveLength

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
        ActiveInPast.new([PeriodInYears.new(1968, 1980)])
      ),
      Artist.new(
        "Bee Gees",
        :pop,
        Location.new("England"),
        ActiveInPast.new([PeriodInYears.new(1958, 2003), PeriodInYears.new(2009, 2012)])
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

  defp obeys_condition?(%SearchByActiveYears{period: period}, artist),
    do: was_artist_active(artist, period)

  defp obeys_condition?(%SearchByActiveLength{how_long: how_long, until: until}, artist),
    do: active_length(artist, until) >= how_long

  @spec was_artist_active(Artist.t(), PeriodInYears.t()) :: boolean
  defp was_artist_active(
         %Artist{years_active: %StillActive{since: since, previous_periods: previous_periods}},
         search_period
       ) do
    since <= search_period.end or period_overlaps_with_periods(search_period, previous_periods)
  end

  defp was_artist_active(
         %Artist{years_active: %ActiveInPast{periods: periods}},
         search_period
       ) do
    period_overlaps_with_periods(search_period, periods)
  end

  @spec period_overlaps_with_periods(PeriodInYears.t(), [PeriodInYears]) :: boolean()
  defp period_overlaps_with_periods(checked_period, periods) do
    Enum.any?(periods, fn period ->
      period.start <= checked_period.end and period.end >= checked_period.start
    end)
  end

  @spec active_length(Artist.t(), non_neg_integer()) :: non_neg_integer()
  defp active_length(artist, current_year) do
    periods =
      case artist.years_active do
        %StillActive{since: since, previous_periods: previous_periods} ->
          Enum.reverse([PeriodInYears.new(since, current_year) | previous_periods])

        %ActiveInPast{periods: periods} ->
          periods
      end

    periods
    |> Enum.map(fn p -> p.end - p.start end)
    |> Enum.sum()
  end
end

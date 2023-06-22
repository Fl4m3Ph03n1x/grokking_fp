defmodule Practicing729.PatternMatching do
  alias Practicing729.{Artist, Location, StillActive, ActiveBetween}

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

  @spec active_length(artist :: Artist.t(), current_year :: non_neg_integer()) ::
          non_neg_integer()
  def active_length(
        %Artist{years_active: %ActiveBetween{start: start_year, end: end_year}},
        _current_year
      ) do
    end_year - start_year
  end

  def active_length(%Artist{years_active: %StillActive{since: year}}, current_year) do
    current_year - year
  end
end

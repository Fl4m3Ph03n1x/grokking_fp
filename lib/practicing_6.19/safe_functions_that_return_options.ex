defmodule SafeFunctionsThatReturnOptions do
  alias TvShow
  alias Option
  alias StringHelpers

  @spec parse_show(String.t()) :: Option.t(TvShow.t())
  def parse_show(raw_show) do
    for name <- extract_name(raw_show),
        year_start <- extract_year_start(raw_show),
        year_end <- extract_year_end(raw_show),
        into: Option.new() do
      %TvShow{name: name, year_end: year_end, year_start: year_start}
    end
  end

  @spec extract_name(String.t()) :: Option.t(String.t())
  def extract_name(raw_show) do
    bracket_open_index = StringHelpers.index_of(raw_show, "(")

    if valid_index?(bracket_open_index) do
      raw_show
      |> String.slice(0..(bracket_open_index - 1))
      |> String.trim()
      |> Option.new()
    else
      Option.new()
    end
  end

  @spec extract_year_start(String.t()) :: Option.t(non_neg_integer)
  def extract_year_start(raw_show) do
    bracket_open = StringHelpers.index_of(raw_show, "(")
    dash = StringHelpers.index_of(raw_show, "-")

    for year_str <- parse_year_start(bracket_open, dash, raw_show),
        year <- StringHelpers.to_int_maybe(year_str),
        into: Option.new() do
      year
    end
  end

  @spec extract_year_end(String.t()) :: Option.t(non_neg_integer)
  def extract_year_end(raw_show) do
    dash = StringHelpers.index_of(raw_show, "-")
    bracket_close = StringHelpers.index_of(raw_show, ")")

    for year_str <- parse_year_end(dash, bracket_close, raw_show),
        year <- StringHelpers.to_int_maybe(year_str),
        into: Option.new() do
      year
    end
  end

  @spec parse_year_start(integer, integer, String.t()) :: Option.t(String.t())
  defp parse_year_start(bracket_open_index, dash_index, raw_show) do
    if valid_index?(bracket_open_index) and dash_index >= bracket_open_index + 1 do
      raw_show
      |> String.slice((bracket_open_index + 1)..(dash_index - 1))
      |> Option.new()
    else
      Option.new()
    end
  end

  @spec parse_year_end(integer, integer, String.t()) :: Option.t(String.t())
  defp parse_year_end(dash_index, bracket_end_index, raw_show) do
    if valid_index?(bracket_end_index) and dash_index <= bracket_end_index - 1 do
      raw_show
      |> String.slice((dash_index + 1)..(bracket_end_index - 1))
      |> Option.new()
    else
      Option.new()
    end
  end

  @spec valid_index?(integer) :: boolean
  defp valid_index?(index), do: index != -1
end

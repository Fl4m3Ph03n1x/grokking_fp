defmodule SafeFunctionsThatReturnEither do
  alias TvShow
  alias Either
  alias StringHelpers

  @spec parse_shows([String.t()]) :: Either.t(String.t(), [TvShow.t()])
  def parse_shows(raw_shows),
    do:
      raw_shows
      |> Enum.map(&parse_show/1)
      |> Enum.reduce(Either.right([]), &add_or_resign/2)

  @spec add_or_resign(Either.t(String.t(), TvShow.t()), Either.t(String.t(), [TvShow.t()])) ::
          Either.t(String.t(), [TvShow.t()])
  def add_or_resign(new_show, parsed_shows) do
    for all_shows <- parsed_shows, show <- new_show, into: Either.new() do
      [show | all_shows]
    end
  end

  @spec parse_show(String.t()) :: Either.t(String.t(), TvShow.t())
  def parse_show(raw_show) do
    for name <- extract_name(raw_show),
        year_start <-
          raw_show
          |> extract_year_start()
          |> Either.or_else(extract_single_year(raw_show)),
        year_end <-
          raw_show
          |> extract_year_end()
          |> Either.or_else(extract_single_year(raw_show)),
        into: Either.new() do
      %TvShow{name: name, year_end: year_end, year_start: year_start}
    end
  end

  @spec extract_name(String.t()) :: Either.t(String.t(), String.t())
  def extract_name(raw_show) do
    bracket_open_index = StringHelpers.index_of(raw_show, "(")

    if valid_index?(bracket_open_index) and bracket_open_index > 0 do
      raw_show
      |> String.slice(0..(bracket_open_index - 1))
      |> String.trim()
      |> Either.right()
    else
      Either.left("Cannot extract name from '#{raw_show}'")
    end
  end

  @spec extract_year_start(String.t()) :: Either.t(String.t(), non_neg_integer)
  def extract_year_start(raw_show) do
    bracket_open = StringHelpers.index_of(raw_show, "(")
    dash = StringHelpers.index_of(raw_show, "-")

    for year_str <- parse_year_start(bracket_open, dash, raw_show),
        year <-
          year_str
          |> StringHelpers.to_int_maybe()
          |> Option.to_right("Can't parse '#{year_str}'"),
        into: Either.new() do
      year
    end
  end

  @spec extract_year_end(String.t()) :: Either.t(String.t(), non_neg_integer)
  def extract_year_end(raw_show) do
    dash = StringHelpers.index_of(raw_show, "-")
    bracket_close = StringHelpers.index_of(raw_show, ")")

    for year_str <- parse_year_end(dash, bracket_close, raw_show),
        year <-
          year_str
          |> StringHelpers.to_int_maybe()
          |> Option.to_right("Can't parse '#{year_str}'"),
        into: Either.new() do
      year
    end
  end

  @spec extract_single_year(String.t()) :: Either.t(String.t(), non_neg_integer)
  def extract_single_year(raw_show) do
    dash_index = StringHelpers.index_of(raw_show, "-")
    bracket_open_index = StringHelpers.index_of(raw_show, "(")
    bracket_close_index = StringHelpers.index_of(raw_show, ")")

    for year_str <-
          parse_single_year(bracket_open_index, dash_index, bracket_close_index, raw_show),
        year <-
          year_str
          |> StringHelpers.to_int_maybe()
          |> Option.to_right("Can't parse '#{year_str}'"),
        into: Either.new() do
      year
    end
  end

  @spec parse_year_start(integer, integer, String.t()) :: Either.t(String.t(), String.t())
  def parse_year_start(bracket_open_index, dash_index, raw_show) do
    if valid_index?(bracket_open_index) and dash_index >= bracket_open_index + 1 do
      raw_show
      |> String.slice((bracket_open_index + 1)..(dash_index - 1))
      |> Either.right()
    else
      Either.left("Can't extract start year from '#{raw_show}'")
    end
  end

  @spec parse_year_end(integer, integer, String.t()) :: Either.t(String.t(), String.t())
  defp parse_year_end(dash_index, bracket_end_index, raw_show) do
    if valid_index?(bracket_end_index) and dash_index <= bracket_end_index - 1 do
      raw_show
      |> String.slice((dash_index + 1)..(bracket_end_index - 1))
      |> Either.right()
    else
      Either.left("Can't extract end year from '#{raw_show}'")
    end
  end

  @spec parse_single_year(integer, integer, integer, String.t()) ::
          Either.t(String.t(), String.t())
  defp parse_single_year(bracket_open_index, dash_index, bracket_close_index, raw_show) do
    if not valid_index?(dash_index) and valid_index?(bracket_open_index) and
         bracket_close_index > bracket_open_index + 1 do
      raw_show
      |> String.slice((bracket_open_index + 1)..(bracket_close_index - 1))
      |> Either.right()
    else
      Either.left("Can't extract single year from '#{raw_show}'")
    end
  end

  @spec valid_index?(integer) :: boolean
  defp valid_index?(index), do: index != -1
end

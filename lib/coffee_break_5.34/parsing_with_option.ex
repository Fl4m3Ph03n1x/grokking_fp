defmodule CoffeeBreak534.ParsingWithOption do
  alias CoffeeBreak534.Event

  @type option(t) :: some(t) | nothing
  @type some(t) :: [t]
  @type nothing :: []

  @spec validate_name(String.t()) :: option(String.t())
  def validate_name(name) do
    if String.length(name) > 0 do
      [name]
    else
      []
    end
  end

  @spec validate_end(integer) :: option(integer())
  def validate_end(the_end) do
    if the_end < 3000 do
      [the_end]
    else
      []
    end
  end

  @spec validate_start(integer(), integer()) :: option(integer())
  def validate_start(start, the_end) do
    if start <= the_end do
      [start]
    else
      []
    end
  end

  @spec validate_length(integer(), integer(), integer()) :: option(integer())
  def validate_length(a_start, an_end, min_length) do
    actual_length = an_end - a_start

    if actual_length >= min_length do
      [actual_length]
    else
      []
    end
  end

  @spec parse(String.t(), integer(), integer()) :: option(Event.t())
  def parse(name, a_start, an_end) do
    for valid_name <- validate_name(name),
        valid_end <- validate_end(an_end),
        valid_start <- validate_start(a_start, an_end) do
      %Event{name: valid_name, start: valid_start, end: valid_end}
    end
  end

  @spec parse_long_event(String.t(), integer(), integer(), integer()) :: option(Event.t())
  def parse_long_event(name, a_start, an_end, min_length) do
    for valid_name <- validate_name(name),
        valid_end <- validate_end(an_end),
        valid_start <- validate_start(a_start, an_end),
        _valid_length <- validate_length(a_start, an_end, min_length) do
      %Event{name: valid_name, start: valid_start, end: valid_end}
    end
  end
end

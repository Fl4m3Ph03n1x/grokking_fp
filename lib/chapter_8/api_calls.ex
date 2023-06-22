defmodule Chapter8.ApiCalls do
  alias Chapter8.MeetingTime

  @spec create_meeting(names :: [String.t()], meeting_time :: MeetingTime.t()) :: :ok
  def create_meeting(_names, _meeting_time) do
    if :rand.uniform() < 0.25 do
      throw("No Network")
    else
      IO.puts("SIDE-EFFECT")
    end
  end

  @spec callendar_entries(name :: String.t()) :: [MeetingTime.t()]
  def callendar_entries(name) do
    if :rand.uniform() < 0.25 do
      throw("Connection Error")
    end

    case name do
      "Alice" -> [MeetingTime.new(8, 10), MeetingTime.new(11, 12)]
      "Bob" -> [MeetingTime.new(9, 10)]
      _ -> [MeetingTime.new(:rand.uniform(5) + 8, :rand.uniform(4) + 13)]
    end
  end
end

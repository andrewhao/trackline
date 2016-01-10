defmodule Trackline do
  @moduledoc """
  A GPX parser that returns raw GPX point structs.
  """

  use Timex

  defmodule TrackPoint do
    @moduledoc """
    Represents a GPX Trackpoint
    """
    defstruct lat: nil, lon: nil, ele: nil, time: nil
  end

  defmodule Runner do
    @moduledoc """
    Entry point to the lib.
    """
    require Record
    Record.defrecord :xmlAttribute,
      Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")
    Record.defrecord :xmlText,
      Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

    @spec run(String) :: List
    def run(file_path) do
      doc = Exmerl.parse(file_path)
      doc
        |> Exmerl.XPath.find("//trkpt")
        |> elem(0)
        |> List.foldl([], fn (x, acc) ->
          lat = x
                |> Exmerl.XPath.find("//@lat")
                |> text
                |> Float.parse
                |> elem(0)
          lon = x |> Exmerl.XPath.find("//@lon")
                  |> text
                  |> Float.parse
                  |> elem(0)
          time = x
                 |> Exmerl.XPath.find("//time/text()")
                 |> text
                 |> DateFormat.parse("{ISOz}")
                 |> elem(1)
          ele = x
                |> Exmerl.XPath.find("//ele/text()")
                |> text
                |> Float.parse |> elem(0)
          acc ++ [%TrackPoint{lat: lat,
                              lon: lon,
                              ele: ele,
                              time: time}]
        end)
    end

    def text([xmlAttribute(value: value)]) do
      List.to_string(value)
    end

    def text([xmlText(value: value)]) do
      List.to_string(value)
    end
  end
end

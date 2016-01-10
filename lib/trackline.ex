defmodule Trackline do
  @moduledoc """
  A GPX parser that returns raw GPX point structs.
  """

  defmodule TrackPoint do
    defstruct lat: nil, lon: nil
  end

  defmodule Runner do
    @moduledoc """
    Kicks off the parsing functions.
    """
    require Record
    Record.defrecord :xmlAttribute,
      Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")

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
          acc ++ [%TrackPoint{lat: lat, lon: lon}]
        end)
    end

    def text([xmlAttribute(value: value)]) do
      List.to_string(value)
    end
  end
end

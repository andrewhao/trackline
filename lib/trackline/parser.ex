defmodule Trackline.Parser do
  @moduledoc """
  Entry point to the lib.
  """
  use Timex
  require Record

  alias Trackline.Trackpoint

  Record.defrecord :xmlAttribute,
    Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,
    Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

  @spec parse(String) :: List
  def parse(file_path) do
    doc = Exmerl.parse(file_path)
    doc
      |> Exmerl.XPath.find("//trkpt")
      |> elem(0)
      |> List.foldl([], fn (x, acc) ->
        {lat, _} = x
              |> Exmerl.XPath.find("//@lat")
              |> text
              |> Float.parse
        {lon, _} = x |> Exmerl.XPath.find("//@lon")
                |> text
                |> Float.parse
        {:ok, time} = x
               |> Exmerl.XPath.find("//time/text()")
               |> text
               |> DateFormat.parse("{ISOz}")
        {ele, _} = x
              |> Exmerl.XPath.find("//ele/text()")
              |> text
              |> Float.parse
        acc ++ [%Trackpoint{lat: lat,
                            lon: lon,
                            ele: ele,
                            time: time}]
      end)
  end

  defp text([xmlAttribute(value: value)]) do
    List.to_string(value)
  end

  defp text([xmlText(value: value)]) do
    List.to_string(value)
  end
end

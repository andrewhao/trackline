defmodule Trackline.Trackpoint do
  @moduledoc """
  A GPX Trackpoint
  """
  @type t :: map

  defstruct lat: nil, lon: nil, ele: nil, time: nil
end

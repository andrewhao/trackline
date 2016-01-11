defmodule Trackline.Calculator do
  @moduledoc """
  A bucket of functions meant to perform calculations.
  """

  alias Trackline.Trackpoint

  # Earth mean radius, kilometers.
  @earth_radius 6371

  @spec track_distance(List<Trackpoint>) :: float()
  def track_distance()

  # https://en.wikipedia.org/wiki/Haversine_formula
  @spec haversine_distance(Trackpoint.t, Trackpoint.t) :: float()
  def haversine_distance(t1, t2) do
    lat1_r = t1.lat |> to_r
    lon1_r = t1.lon |> to_r
    lat2_r = t2.lat |> to_r
    lon2_r = t2.lon |> to_r

    d_lat = lat2_r - lat1_r
    d_lon = lon2_r - lon1_r

    a = :math.sin(d_lat / 2) * :math.sin(d_lat / 2) +
      (:math.cos(lat1_r) * :math.cos(lat2_r) * :math.sin(d_lon / 2) * :math.sin(d_lon / 2))
    c = 2 * :math.atan2(:math.sqrt(a), :math.sqrt(1-a))
    @earth_radius * c
  end

  @spec to_r(Float) :: float()
  def to_r(latlon) do
    (latlon * :math.pi) / 180.0
  end
end

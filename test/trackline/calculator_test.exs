defmodule Trackline.CalculatorTest do
  use ExUnit.Case
  doctest Trackline.Calculator

  alias Trackline.Trackpoint

  test "#haversine_distance" do
    lat1 = 37.7985474
    lat2 = 37.7985583
    lon1 = -122.2554386
    lon2 = -122.2554564

    t1 = %Trackpoint{lat: lat1, lon: lon1}
    t2 = %Trackpoint{lat: lat2, lon: lon2}

    expected_distance = 0.00197862991592239

    assert_in_delta Trackline.Calculator.haversine_distance(t1, t2), expected_distance, 1.0e-10
  end

  test "#to_r" do
    lat1 = 37.7985474
    expected_radians = 0.6597091046011421
    assert Trackline.Calculator.to_r(lat1) == expected_radians
  end
end

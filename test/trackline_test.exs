defmodule TracklineTest do
  use ExUnit.Case
  doctest Trackline

  test "returns a set of trackpoints" do
    test_file_path = 'test/gpx/simple.gpx'
    assert Trackline.Runner.run(test_file_path) ==
      [%Trackline.TrackPoint{lat: 1.0, lon: 2.0},
       %Trackline.TrackPoint{lat: 3.0, lon: 4.0}]
  end
end

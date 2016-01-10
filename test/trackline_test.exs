defmodule TracklineTest do
  use ExUnit.Case
  use Timex
  doctest Trackline

  test "returns a set of trackpoints" do
    test_file_path = 'test/gpx/simple.gpx'
    assert Trackline.Runner.run(test_file_path) ==
      [
        %Trackline.TrackPoint{
          lat: 1.0,
          lon: 2.0,
          ele: 35.0,
          time: Date.from({{2007, 11, 23}, {23, 49, 43}})},
       %Trackline.TrackPoint{
          lat: 3.0,
          lon: 4.0,
          ele: 35.1,
          time: Date.from({{2007, 11, 23}, {23, 49, 44}})}
       ]
  end
end

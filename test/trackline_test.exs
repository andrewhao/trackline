defmodule TracklineTest do
  use ExUnit.Case
  doctest Trackline

  test "analyzes GPX" do
    test_file_path = 'test/gpx/simple.gpx'
    assert Trackline.Runner.run(test_file_path) == true
  end
end

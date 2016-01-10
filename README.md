# Trackline

GPX parsing and stats.

[![Build Status](https://travis-ci.org/andrewhao/trackline.svg)](https://travis-ci.org/andrewhao/trackline)

## Usage

```elixir
Trackline.Runner.run("path/to/sample.gpx")

# Output is a List of Trackline.TrackPoint objects:
[%Trackline.TrackPoint{ele: 50.0, lat: 1.0, lon: 2.0,
  time: %Timex.DateTime{calendar: :gregorian, day: 23,
   hour: 23, minute: 49, month: 11, ms: 0, second: 43,
   timezone: %Timex.TimezoneInfo{abbreviation: "UTC",
    from: :min, full_name: "UTC", offset_std: 0,
    offset_utc: 0, until: :max}, year: 2007}},
 %Trackline.TrackPoint{ele: 50.0, lat: 3.0, lon: 4.0,
  time: %Timex.DateTime{calendar: :gregorian, day: 23,
   hour: 23, minute: 49, month: 11, ms: 0, second: 44,
   timezone: %Timex.TimezoneInfo{abbreviation: "UTC",
    from: :min, full_name: "UTC", offset_std: 0,
    offset_utc: 0, until: :max}, year: 2007}}]
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add trackline to your list of dependencies in `mix.exs`:

        def deps do
          [{:trackline, "~> 0.0.1"}]
        end

  2. Ensure trackline is started before your application:

        def application do
          [applications: [:trackline]]
        end

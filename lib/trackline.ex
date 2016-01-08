require IEx

defmodule Trackline do
  @moduledoc """
  Starting point for our journey. Get it?
  """

  defmodule Runner do
    def run(file_path) do
      e = Exmerl.parse(file_path)
      IEx.pry
      true
    end
  end
end

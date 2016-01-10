defmodule Trackline.Mixfile do
  use Mix.Project

  def project do
    [app: :trackline,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:erlsom, "~>1.2"},
      {:exml, "~> 0.1"},
      {:exmerl, "~> 0.1"},
      {:mix_test_watch, "~> 0.2", only: :dev},
      {:dogma, "~> 0.0", only: :dev},
      {:timex, "~> 1.0.0"},
      {:apex, "~> 0.3.5"},
      {:dialyxir, "~> 0.3", only: [:dev]}
    ]
  end
end

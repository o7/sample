defmodule Sample.MixProject do
  use Mix.Project

  def project do
    [
      app: :sample,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Sample.Application, []}
    ]
  end

  defp deps do
    [
      {:n2o, github: "5HT/n2o"},
      {:cowboy, "~> 2.0"}
    ]
  end
end

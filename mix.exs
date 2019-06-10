defmodule Sample.Mixfile do
  use Mix.Project
  def project, do: [app: :sample, version: "6.6.6", elixir: "~> 1.7", deps: deps()]
  def application, do: [mod: {Sample.Application, []}]
  def deps,
    do: [
      {:cowboy, "~> 2.5"},
      {:gproc, github: "voxoz/gproc"},
      {:n2o,   github: "synrc/n2o"},
      {:kvx,   github: "synrc/kvx"},
      {:nitro, github: "synrc/nitro"}
    ]
end

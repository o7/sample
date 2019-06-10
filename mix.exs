defmodule Sample.Mixfile do
  use Mix.Project
  def project, do: [app: :sample, version: "6.6.6", elixir: "~> 1.7", deps: deps()]
  def application, do: [extra_applications: [:cowboy, :n2o], mod: {Sample.Application, []}]
  def deps,
    do: [
      {:n2o,   github: "synrc/n2o"},
      {:kvx,   github: "synrc/kvx"},
      {:nitro, github: "synrc/nitro"},
      {:gproc, github: "voxoz/gproc"},
      {:cowboy, "~> 2.5"}
    ]
end

defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "6.6.6",
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  def application() do
    [mod: {Sample.Application, []}]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:cowboy, "~> 2.5"},
      {:rocksdb, github: "voxoz/rocks"},
      {:gproc, github: "voxoz/gproc"},
      {:n2o, github: "synrc/n2o"},
      {:kvx, github: "synrc/kvx"},
      {:nitro, github: "synrc/nitro"}
    ]
  end
end

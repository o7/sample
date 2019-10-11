defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "0.8.1",
      description: "SAMPLE Elixir Application",
      package: package(),
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  def package do
    [
      files: ~w(doc lib mix.exs LICENSE),
      licenses: ["ISC"],
      maintainers: ["Namdak Tonpa"],
      name: :sample,
      links: %{"GitHub" => "https://github.com/o7/sample"}
    ]
  end


  def application() do
    [mod: {Sample.Application, []}, applications: [:ranch, :cowboy, :rocksdb, :logger, :n2o, :kvs, :syn, :nitro]]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:cowboy, "~> 2.5.0"},
      {:rocksdb, "~> 1.3.2"},
      {:n2o, "~> 6.10.0"},
      {:syn, "~> 1.6.3"},
      {:kvs, "~> 6.9.2"},
      {:nitro, "~> 4.10.0"},
    ]
  end
end

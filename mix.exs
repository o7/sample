defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "0.7.7",
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
    [mod: {Sample.Application, []}, applications: [:ranch, :cowboy, :rocksdb, :n2o, :kvs, :syn, :nitro]]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.20.2", only: :dev},
      {:cowboy, "~> 2.5.0"},
      {:rocksdb, "~> 1.2.0"},
      {:n2o, "~> 6.7.4"},
      {:syn, "~> 1.6.3"},
      {:kvs, "~> 6.7.4"},
      {:nitro, "~> 4.7.3"},
    ]
  end
end

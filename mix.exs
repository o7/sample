defmodule Sample.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :sample,
      version: "6.6.6",
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
    [mod: {Sample.Application, []}, applications: [:ranch, :cowboy, :rocksdb, :n2o, :kvs, :syn]]
  end

  def deps() do
    [
      {:ex_doc, "~> 0.11", only: :dev},
      {:cowboy, "~> 2.5"},
      {:rocksdb, "~> 1.2.0"},
      {:n2o, "~> 6.6"},
      {:nitro, "~> 4.4.1"},
      {:syn, "~> 1.6.3"},
      {:kvs, "~> 6.6"}
    ]
  end
end

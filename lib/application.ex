defmodule Sample.Application do
  use Application
  use N2O

  def room() do
    case N2O.session(:room) do
         '' -> '/root'
         "" -> '/root'
          x -> x
    end
  end

  def start(_, _) do
    initialize()
    Supervisor.start_link([], strategy: :one_for_one, name: Sample.Supervisor)
  end

  def initialize() do
    :cowboy.start_tls(:http, :n2o_cowboy.env(:sample), %{env: %{dispatch: :n2o_cowboy2.points()}})
    :kvs.join()
    :syn.init()
  end

end

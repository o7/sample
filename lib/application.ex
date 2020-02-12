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

  def points() do
    :cowboy_router.compile([
      {:_,
       [
         {'/ws/[...]', :n2o_cowboy2, []},
         {'/rest/track', :rest_onlyoffice, []},
         {'/bin/[...]', :cowboy_static, {:dir, "priv/storage", []}},
         {'/app/[...]', :cowboy_static, {:dir, "priv/static", []}}
       ]}
    ])
  end

  def env(_app) do
    [
      {:port, :application.get_env(:n2o, :port, 8002)}
    ]
  end

  def initialize() do
    IO.inspect :cowboy.start_clear(:http, env(:samaple), %{env: %{dispatch: points()}})
    :kvs.join()
    :syn.init()
  end

end

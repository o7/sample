defmodule Sample.Supervisor do
  use Supervisor
  def start_link(opts) do
      Supervisor.start_link(Sample.Supervisor, [], opts)
      Supervisor.start_link(:n2o,[],[])
  end
  def init(_), do: Supervisor.init([], strategy: :one_for_one)
end

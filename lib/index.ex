defmodule Sample.Index do
  def event(:init) do
      room = :n2o.session(:room)
      :n2o.reg({:topic,room})
      IO.inspect(room)
  end
  def event(o), do: IO.inspect(o)
end

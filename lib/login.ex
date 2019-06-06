defmodule Sample.Login do

    def event(:init), do: IO.inspect(:init)
    def event(Other), do: IO.inspect(Other)

end

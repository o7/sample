defmodule Sample.Routes do

  def finish(state, ctx) do
    {:ok, state, ctx}
  end

  # erlrecord_cx(req: req) = cx) do
  def init(state, cx) do
    IO.inspect(cx)
    raise "WOO"
    # path = case(:review.ver()) do
    #   :cow1 ->
    #     :n2o_cowboy.path(req)
    #   :cow2 ->
    #     %{path: p} = req
    #     p
    # end
    # fix = route_prefix(path)
    # :n2o.info(__MODULE__, 'Route: ~p~n', [{fix, path}])
    # {:ok, state, erlrecord_cx(cx, path: path, module: fix)}
  end

  defp route_prefix(<<"/ws/", p::binary>>) do
    route(p)
  end

  defp route_prefix(<<"/", p::binary>>) do
    route(p)
  end

  defp route_prefix(p) do
    route(p)
  end

  defp route(<<>>) do
    :login
  end

  defp route(<<"index", _::binary>>) do
    :index
  end

  defp route(<<"login", _::binary>>) do
    :login
  end

  defp route(<<"app/index", _::binary>>) do
    :index
  end

  defp route(<<"app/login", _::binary>>) do
    :login
  end

  defp route(_) do
    :login
  end
end

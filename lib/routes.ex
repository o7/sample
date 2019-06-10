defmodule Sample.Routes do

  import N2O

  def finish(state, cx), do: {:ok, state, cx}
  def init(state, ctx) do
      %{path: p} = cx(ctx,:req)
      IO.inspect(route_prefix(p))
      {:ok, state, cx(ctx, path: p, module: route_prefix(p))}
  end

  defp route_prefix(<<"/ws/", p::binary>>), do: route(p)
  defp route_prefix(<<"/", p::binary>>),    do: route(p)
  defp route_prefix(p),                     do: route(p)

  defp route(<<>>),                         do: Sample.Login
  defp route(<<"index", _::binary>>),       do: Sample.Index
  defp route(<<"login", _::binary>>),       do: Sample.Login
  defp route(<<"app/index", _::binary>>),   do: Sample.Index
  defp route(<<"app/login", _::binary>>),   do: Sample.Login
  defp route(_),                            do: Sample.Login

end

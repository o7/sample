defmodule Sample.Application do

  use Application

  def start(_,_) do
    start_cowboy()
    Supervisor.start_link([], [strategy: :one_for_one, name: Sample.Supervisor])
  end

  def start_cowboy() do
    {:tls, :cowboy.start_tls(:http,
       [ port: Application.get_env(:n2o, :port, 8001),
         certfile: :code.priv_dir(:sample) ++ '/ssl/fullchain.pem',
         keyfile: :code.priv_dir(:sample) ++ '/ssl/privkey.pem',
         cacertfile: :code.priv_dir(:sample) ++ '/ssl/fullchain.pem' ],
      %{ env: %{dispatch: :n2o_cowboy2.points()} })} |> IO.inspect()
  end

end

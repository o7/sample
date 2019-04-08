defmodule Sample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  # def start(_type, _args) do
  #   # List all child processes to be supervised
  #   children = [
  #     # Starts a worker by calling: Sample.Worker.start_link(arg)
  #     # {Sample.Worker, arg},
  #   ]

  #   # See https://hexdocs.pm/elixir/Supervisor.html
  #   # for other strategies and supported options
  #   opts = [strategy: :one_for_one, name: Sample.Supervisor]
  #   Supervisor.start_link(children, opts)
  # end

  def start(_type, _args) do
    {:tls,
     :cowboy.start_tls(
       :http,
       [
         port: port(),
         certfile: :code.priv_dir(:sample) ++ '/ssl/fullchain.pem',
         keyfile: :code.priv_dir(:sample) ++ '/ssl/privkey.pem',
         cacertfile: :code.priv_dir(:sample) ++ '/ssl/fullchain.pem'
       ],
       %{env: %{dispatch: :n2o_cowboy2.points()}}
     )} |> IO.inspect

    children = []

    opts = [strategy: :one_for_one, name: Sample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def port() do
    Application.get_env(:n2o, :port, 8001)
  end
end

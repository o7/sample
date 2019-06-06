use Mix.Config

config :n2o,
  event: :pickle,
  formatter: :n2o_bert,
  pickler: :n2o_secret,
  routes: Sample.Routes

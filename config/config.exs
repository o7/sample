use Mix.Config

config :n2o,
  event: :pickle,
  formatter: :n2o_bert,
  pickler: :n2o_secret,
  protocols: [:n2o_nitro, :n2o_ftp],
  routes: Sample.Routes

config :kvx,
  dba: :kvx_rocks,
  dba_st: :kvx_st,
  schema: [:kvx, :kvx_stream]

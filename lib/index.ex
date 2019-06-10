defmodule Sample.Index do
  use Sample.Ported, with: ~w|kvx n2o nitro client|a

  def event(:init) do
    room = N2o.session(:room)
    Kvx.save(Kvx.writer(Nitro.to_binary(room)))
    N2o.reg({:topic, room})
    N2o.reg(N2o.sid())
    Nitro.clear(:history)
    Nitro.update(:upload, upload())
    Nitro.update(:heading, h2(id: :heading, body: room))
    Nitro.update(:logout, button(id: :logout, postback: :logout, body: "Logout"))
    Nitro.update(:send, button(id: :send, body: "Chat", postback: :chat, source: [:message]))
    Enum.each(Kvx.all(room), fn {:msg, _, u, m} -> event({:client, {u, m}}) end)
  end

  def event(:logout) do
    N2o.user([])
    Nitro.redirect("/app/login.htm")
  end

  def event(:chat) do
    room = N2o.session(:room)
    usr = N2o.user()
    msg = Nitro.q(:message)
    Kvx.save(Kvx.add(writer(Kvx.writer(room), args: {:msg, Kvx.seq([], []), usr, msg})))
    N2o.send({:topic, room}, client(data: {usr, msg}))
  end

  def event({:client, {usr, msg}}) do
    Nitro.wire(jq(target: :message, method: [:focus, :select]))
    Nitro.insert_top(:history, message(body: [author(body: usr), msg]))
  end

  def event(o), do: IO.inspect(o)
end

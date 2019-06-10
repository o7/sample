defmodule Sample.Index do
  use Sample.Ported, with: ~w|kvx n2o nitro client|a

  def event(:init) do
    room = N2O.session(:room)
    KVX.save(KVX.writer(NITRO.to_binary(room)))
    N2O.reg({:topic, room})
    N2O.reg(N2O.sid())
    NITRO.clear(:history)
    NITRO.update(:upload, upload())
    NITRO.update(:heading, h2(id: :heading, body: room))
    NITRO.update(:logout, button(id: :logout, postback: :logout, body: "Logout"))
    NITRO.update(:send, button(id: :send, body: "Chat", postback: :chat, source: [:message]))
    Enum.each(KVX.all(room), fn {:msg, _, u, m} -> event({:client, {u, m}}) end)
  end

  def event(:logout) do
    N2O.user([])
    NITRO.redirect("/app/login.htm")
  end

  def event(:chat) do
    room = N2O.session(:room)
    usr = N2O.user()
    msg = NITRO.q(:message)
    KVX.save(KVX.add(writer(KVX.writer(room), args: {:msg, KVX.seq([], []), usr, msg})))
    N2O.send({:topic, room}, client(data: {usr, msg}))
  end

  def event({:client, {usr, msg}}) do
    NITRO.wire(jq(target: :message, method: [:focus, :select]))
    NITRO.insert_top(:history, message(body: [author(body: usr), msg]))
  end

  def event(o), do: IO.inspect(o)
end

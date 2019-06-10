defmodule Sample.Index do

  import NITRO
  import N2O
  import KVX

  def event(:init) do
      room = :n2o.session(:room)
      :kvx.save(:kvx.writer(:nitro.to_binary(room)))
      :n2o.reg({:topic,room})
      :n2o.reg(:n2o.sid())
      :nitro.clear (:history)
      :nitro.update(:upload,  upload())
      :nitro.update(:heading, h2(id: :heading, body: room))
      :nitro.update(:logout,  button(id: :logout, postback: :logout,
                              body: "Logout " <> :nitro.to_binary(:n2o.user())))
      :nitro.update(:send,    button(id: :send, body: "Chat",
                              postback: :chat, source: [:message]))

      Enum.each :kvx.all(room), fn {:msg,_,u,m} -> event({:client,{u,m}}) end

  end

  def event(:logout) do
      :n2o.user([])
      :nitro.redirect("/app/login.htm")
  end

  def event(:chat) do
      room = :n2o.session(:room)
      usr  = :n2o.user()
      msg  = :nitro.q(:message)
      :nitro.update(:heading, h2(id: :heading, body: room))
      :kvx.save(:kvx.add(writer(:kvx.writer(room), args: {:msg,:kvx.seq([],[]),usr,msg})))
      :n2o.send({:topic,room},client(data: {usr,msg}))
  end

  def event({:client,{usr,msg}}) do
      :nitro.wire(jq(target: :message,method: [:focus,:select]))
      :nitro.insert_top(:history, message(body: [author(body: usr), msg]))
  end

  def event(o), do: IO.inspect(o)

end

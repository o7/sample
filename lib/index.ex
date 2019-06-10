defmodule Sample.Index do

  import NITRO

  def event(:init) do
      room = :n2o.session(:room)
      :n2o.reg({:topic,room})
      IO.inspect(room)
      sid = :n2o.sid()
      :n2o.reg(sid)

      :nitro.clear(:history)
      :nitro.update(:upload,  upload())
      :nitro.update(:heading, h2(id: :heading, body: room))

      :nitro.update(:logout,  button(id: :logout,
                                   body: "Logout" <> :nitro.to_binary(:n2o.user()),
                               postback: :logout))

      :nitro.update(:send,    button(id: :send,
                                   body: "Chat",
                               postback: :chat,
                                 source: [:message]))
  end

  def event(:logout) do
      :n2o.user([])
      :nitro.redirect("/app/login.htm")
  end

  def event(:chat) do
  end

  def event(o), do: IO.inspect(o)

end

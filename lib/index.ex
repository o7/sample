defmodule Sample.Index do
  use N2O, with: [:kvx, :n2o, :nitro]

  require Logger

  def event(:init) do
    room = N2O.session(:room)
    KVX.ensure(writer(id: room))
    N2O.reg({:topic, room})
    N2O.reg(N2O.sid())
    NITRO.clear(:history)
    NITRO.update(:upload, upload())
    NITRO.update(:heading, h2(id: :heading, body: room))
    NITRO.update(:logout, button(id: :logout, postback: :logout, body: "Logout"))
    NITRO.update(:send, button(id: :send, body: "Chat", postback: :chat, source: [:message]))

    room
    |> KVX.all()
    |> Enum.each(fn {:msg, _, user, message} ->
      event({:client, {user, message}})
    end)
  end

  def event(:logout) do
    N2O.user([])
    NITRO.redirect("/app/login.htm")
  end

  def event(:chat) do
    chat(NITRO.q(:message))
  end

  def event(ftp(sid: s, filename: f, status: {:event, :stop})) do
    name = hd(:lists.reverse(:string.tokens(NITRO.to_list(f), '/')))
    link = link(href: :erlang.iolist_to_binary(["/app/", s, "/", name]), body: name)
    chat(NITRO.render(link))
  end

  def event({:client, {user, message}}) do
    NITRO.wire(jq(target: :message, method: [:focus, :select]))
    NITRO.insert_top(:history, message(body: [author(body: user), NITRO.jse(message)]))
  end

  def event(unexpected) do
    unexpected
    |> inspect()
    |> Logger.warn()
  end

  def chat(message) do
    room = N2O.session(:room)
    user = N2O.user()

    room
    |> KVX.writer()
    |> writer(args: {:msg, KVX.seq([], []), user, message})
    |> KVX.add()
    |> KVX.save()

    N2O.send({:topic, room}, client(data: {user, message}))
  end
end

defmodule Sample.Login do
  require Record
  import  Record, only: [defrecord: 2, extract: 2]
  defrecord :button, extract(:button, from_lib: "nitro/include/nitro.hrl")
  def event(:init) do
      b = button(id: :loginButton, body: "HELO", postback: :login, source: [:user,:pass])
      :nitro.render(b)
      :nitro.update(:loginButton,b)
  end
  def event(:login) do
      user = :nitro.to_list(:nitro.q(:user))
      room = :nitro.to_list(:nitro.q(:pass))
      :n2o.user(user)
      :n2o.session(:room,room)
      :nitro.redirect(["/app/index.htm?room=",room])
  end
  def event(o), do: IO.inspect(o)
end
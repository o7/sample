defmodule Sample.Login do

  import NITRO

  def event(:init) do
      :nitro.update(:loginButton,
             button(id: :loginButton, body: "HELO",
                    postback: :login, source: [:user,:pass]))
  end

  def event(:login) do
      user = :nitro.to_list(:nitro.q(:user))
      room = :nitro.to_binary(:nitro.q(:pass))
      :n2o.user(user)
      :n2o.session(:room,room)
      :nitro.redirect(["/app/index.htm?room=",room])
  end

  def event(o), do: IO.inspect(o)

end

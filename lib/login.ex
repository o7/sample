defmodule Sample.Login do
  use N2O, with: [:n2o, :nitro]

  def event(:init) do
      NITRO.update(:loginButton,
             button(id: :loginButton, body: "HELO",
                    postback: :login, source: [:user,:pass]))
  end

  def event(:login) do
      user = NITRO.to_list(NITRO.q(:user))
      room = NITRO.to_binary(NITRO.q(:pass))
      N2O.user(user)
      N2O.session(:room,room)
      NITRO.redirect(["/app/index.htm?room=",room])
  end

  def event(o), do: IO.inspect(o)

end

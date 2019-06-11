defmodule Sample.Login do
  use N2O, with: [:n2o, :nitro]

  require Logger

  def event(:init) do
    login_button = button(id: :loginButton, body: "HELO", postback: :login, source: [:user, :pass])

    NITRO.update(:loginButton, login_button)
  end

  def event(:login) do
    user = NITRO.to_list(NITRO.q(:user))
    room = NITRO.to_binary(NITRO.q(:pass))
    N2O.user(user)
    N2O.session(:room, room)
    NITRO.redirect(["/app/index.htm?room=", room])
  end

  def event(unexpected) do
    unexpected
    |> inspect()
    |> Logger.warn()
  end
end

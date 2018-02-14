defmodule StorexWeb.Plugs.EnsureCurrentUser do
  import Plug.Conn
  alias Phoenix.Controller
  alias StorexWeb.{Plugs, Router}

  def init(opts), do: opts

  def call(conn, _opts) do
    if Plugs.CurrentUser.get(conn) do
      conn
    else
      conn
      |> Controller.put_flash(:error, "Sign in or Sign up before you continue")
      |> Controller.redirect(to: Router.Helpers.user_path(conn, :new))
    end
  end
end
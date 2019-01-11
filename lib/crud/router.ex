defmodule Crud.Router do
  @moduledoc false

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello, world!")
  end

  match(_, do: send_resp(conn, 404, "This is not the page you are looking for"))
end

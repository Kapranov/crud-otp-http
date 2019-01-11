defmodule Crud.Router do
  @moduledoc false

  use Plug.Router
  require  EEx

  @template "lib/crud/index.html.eex"

  plug(Plug.Static, from: :crud, at: "/static")
  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    response =  EEx.eval_file(@template)
    send_resp(conn, 200, response)
  end

  match(_, do: send_resp(conn, 404, "This is not the page you are looking for"))
end

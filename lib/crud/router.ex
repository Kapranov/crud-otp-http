defmodule Crud.Router do
  @moduledoc false

  use Plug.Router
  require  EEx

  alias Crud.Server

  @template "lib/crud/index.html.eex"

  plug(Plug.Static, from: :crud, at: "/static")
  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    items = Server.show()
    response =  EEx.eval_file(@template, items: items)
    send_resp(conn, 200, response)
  end

  post "/" do
    response = read_input(conn)

    render =
      response
      |> String.replace("+", " ")
      |> Server.add()
      |> build_response

    send_resp(conn, 200, render)
  end

  post "/toggle" do
    response = read_input(conn)

    render =
      response
      |> Server.toggle()
      |> build_response

    send_resp(conn, 200, render)
  end

  post "delete" do
    response = read_input(conn)

    render =
      response
      |> Server.del()
      |> build_response

    send_resp(conn, 200, render)
  end

  match(_, do: send_resp(conn, 404, "This is not the page you are looking for"))

  defp read_input(conn) do
    {:ok, body, _conn} = read_body(conn)
    "item=" <> item = body
    item
  end

  defp build_response(items) do
    EEx.eval_file(@template, items: items)
  end
end

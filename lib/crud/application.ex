defmodule Crud.Application do
  @moduledoc false

  use Application

  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Crud.Router, options: [port: 3000]},
      {Crud.Server, [name: Crud.Server]}
    ]

    opts = [strategy: :one_for_one, name: Crud.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

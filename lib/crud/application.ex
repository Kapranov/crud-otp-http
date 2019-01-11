defmodule Crud.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Crud.Server, [name: Crud.Server]}
    ]

    opts = [strategy: :one_for_one, name: Crud.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

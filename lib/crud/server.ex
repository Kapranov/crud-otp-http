defmodule Crud.Server do
  @moduledoc false

  use GenServer

  @name __MODULE__

  def start_link(opts), do: GenServer.start_link(@name, :ok, opts)

  def init(:ok), do: {:ok, []}
end
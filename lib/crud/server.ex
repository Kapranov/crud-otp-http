defmodule Crud.Server do
  @moduledoc false

  use GenServer

  @name __MODULE__

  def start_link(opts), do: GenServer.start_link(@name, :ok, opts)

  def show, do: GenServer.call(@name, {:show})

  @impl true
  def init(:ok), do: {:ok, []}

  @impl true
  def handle_call({:show}, _from, items) do
    {:reply, items, items}
  end
end

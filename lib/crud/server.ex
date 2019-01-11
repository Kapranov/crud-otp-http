defmodule Crud.Server do
  @moduledoc false

  use GenServer

  @name __MODULE__

  def start_link(opts), do: GenServer.start_link(@name, :ok, opts)

  @doc """
  Show items

  ## Example

      iex> Crud.Server.show
      []

  """
  def show, do: GenServer.call(@name, {:show})

  @doc """
  Add new item

  ## Example

      iex> Crud.Server.add("hello")
      [
        %{
          done: false,
          id: generate_id()
          name: "hello"
        }
      ]
  """
  def add(item), do: GenServer.call(@name, {:add, item})

  @impl true
  def init(:ok), do: {:ok, []}

  @impl true
  def handle_call({:show}, _from, items) do
    {:reply, items, items}
  end

  @impl true
  def handle_call({:add, item}, _from, items) do
    new_item = %{name: item, done: false, id: generate_id()}
    new_items = [new_item | items]

    {:reply, new_items, new_items}
  end

  defp generate_id do
    :crypto.strong_rand_bytes(64)
    |> Base.url_encode64()
    |> binary_part(0,  64)
  end
end

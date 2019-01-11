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
  """
  def add(item), do: GenServer.call(@name, {:add, item})

  @doc """
  Toggle change done on true or false
  """
  def toggle(id), do: GenServer.call(@name, {:toggle, id})

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

  @impl true
  def handle_call({:toggle, id}, _from, items) do
    [item] = Enum.filter(items, fn x -> x.id == id end)
    toggled_item = %{item |  done:  !item.done}
    new_items =
      items
      |> Enum.map(fn x ->
          if is_id?(x, id) do
            toggled_item
          else
            x
          end
      end)

    {:reply, new_items, new_items}
  end

  defp generate_id do
    :crypto.strong_rand_bytes(64)
    |> Base.url_encode64()
    |> binary_part(0,  64)
  end

  defp is_id?(x, id), do: x.id == id
end

defmodule CrudTest do
  use ExUnit.Case
  doctest Crud.Server

  test "show items" do
    items = Crud.Server.show

    assert items == []
  end

  test "add, toggle and destroy item" do
    [item] = Crud.Server.add("hello")
    value1 = Crud.Server.toggle(item.id)
    [%{done: value} | _others] = value1

    assert value == true

    value2 = Crud.Server.toggle(item.id)
    [%{done: value} | _others] = value2

    assert value == false

    destroy = Crud.Server.del(item.id)

    assert destroy == []
  end
end

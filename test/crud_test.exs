defmodule CrudTest do
  use ExUnit.Case
  doctest Crud

  test "show items" do
    items = Crud.Server.show

    assert items == []
  end

  test "add item" do
    item = Crud.Server.add("hello")
    [%{name: value} | _others] = item

    assert value == "hello"
  end
end

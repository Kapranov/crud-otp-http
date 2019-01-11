defmodule CrudTest do
  use ExUnit.Case
  doctest Crud

  test "show items" do
    items = Crud.Server.show

    assert items == []
  end
end

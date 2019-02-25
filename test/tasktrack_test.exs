defmodule TasktrackTest do
  use ExUnit.Case
  doctest Tasktrack

  test "greets the world" do
    assert Tasktrack.hello() == :world
  end
end

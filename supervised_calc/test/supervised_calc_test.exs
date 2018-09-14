defmodule SupervisedCalcTest do
  use ExUnit.Case
  doctest SupervisedCalc

  test "greets the world" do
    assert SupervisedCalc.hello() == :world
  end
end

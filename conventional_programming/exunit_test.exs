ExUnit.start
defmodule MathTest do
  use ExUnit.Case, ansyn: true

  test "can add two numbers" do
    assert 1 + 1 == 2
  end
end

defmodule ControlFlow do
  defmacro unless(expression, do: block) do
    # if !expression, do: block
    IO.puts inspect(expression)
    IO.puts inspect(block)
    # quote do
    #   if !unquote(expression), do: unquote(block)
    # end
  end
end

# require ControlFlow
# ControlFlow.unless 2 == 1, do: IO.puts "2 is not equal to 1"

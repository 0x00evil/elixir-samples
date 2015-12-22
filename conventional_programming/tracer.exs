defmodule Tracer do
  defmacro def(definition = {name, _, args}, do: content) do
             quote do # how to use bind_quoted here?
               Kernel.def(unquote(definition)) do
                        IO.puts "==> call: #{unquote name}, #{inspect(unquote(args))}"
                        result = unquote(content)
                        IO.puts "==> result: #{result}"
                        result
                      end
             end
           end
  defmacro __using__(_) do
    quote do
      import Kernel, except: [def: 2]
      import unquote(__MODULE__), only: [def: 2]
    end
  end
end

defmodule Test do
  use Tracer
  def sum(a, b, c) do
    IO.inspect(a + b + c)
  end
end

Test.sum(1,2,3)

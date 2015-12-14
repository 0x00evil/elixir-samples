defmodule Adder do
  @doc "Defines a function that adds two numbers"

  defmacro defadd do
    quote location: :keep do
      def add(a, b) do
        a + b |> IO.puts
      end
    end
  end
end

defmodule Sample do
  import Adder
  defadd
end

Sample.add(1,2)
Sample.add(:ufck, 1)

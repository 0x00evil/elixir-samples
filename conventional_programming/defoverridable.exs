defmodule DefaultMod do
  defmacro __using__(_opts) do
    quote do
      def test(x, y) do
        x + y
      end
      defoverridable [test: 2]
    end
  end
end

defmodule InheritMod do
  use DefaultMod

  def test(x, y) do
   IO.puts  (x * y + super(x, y))
  end
end

InheritMod.test 1,2

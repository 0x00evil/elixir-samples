defmodule Hello do
  defmacro __using__(opts) do
    IO.puts "welcoming using the #{__MODULE__} and opts is #{opts}"
    IO.puts "#{inspect __CALLER__.module}"
    IO.puts "#{inspect __CALLER__}"
  end

  def hello do
    IO.puts "hello from #{inspect __info__(:functions)}"
  end
end

defmodule Test do
  use Hello, "in Test"
end

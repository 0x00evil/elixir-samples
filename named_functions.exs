defmodule Factorial_v1 do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

Factorial_v1.of(0)
|> IO.puts

Factorial_v1.of(10)
|> IO.puts

defmodule Factorial_v2 do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n-1)
  end
end

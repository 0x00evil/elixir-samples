defmodule Spawn3 do
  def greet do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello, #{msg}"})
    end
  end
end

pid = spawn(Spawn3, :greet, [])
send(pid, {self, "World"})
receive do
  {:ok, message} -> IO.puts(message) # emacs will report a syntax error: missing terminator : end, but why?
end

send(pid, {self, "Elixir"})
receive do
  {:ok, message} -> IO.puts(message)
after
  2000 ->
  IO.puts("The greeter has gone away")
end

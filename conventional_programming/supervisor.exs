defmodule Stack do
  use GenServer

  def start_link(state, opts \\ []) do
    GenServer.start_link(__MODULE__, state, opts)
  end

  def handle_call(:pop, _from, [h | t]) do
    IO.puts h
    {:reply, h, t}
  end

  def handle_cast({:push, h}, t) do
    {:noreply, [h | t]}
  end
end

import Supervisor.Spec

children = [
  worker(Stack, [[:hello], [name: :sup_stack ]])
]

{:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)

GenServer.call(:sup_stack, :pop)
GenServer.cast(:sup_stack, {:push, "world"})
GenServer.call(:sup_stack, :pop)
GenServer.call(:sup_stack, :pop)
b = GenServer.call(:sup_stack, :pop) == "hello"
IO.puts b
# GenServer.cast(:sup_stack, {:push, "return back"})
# GenServer.call(:sup_stack, :pop)

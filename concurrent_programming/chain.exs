defmodule Chain do
  def counter(next_pid) do
    receive do
      n -> send(next_pid, n + 1)
    end
  end

  def create_process(n) do
    last = Enum.reduce(1..n, self, fn (_, send_to) -> spawn(Chain, :counter, [send_to]) end)
    send(last, 0)

    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    :timer.tc(Chain, :create_process, [n])
    |> inspect
    |> IO.puts
  end
end
Chain.run(100)
Chain.run(1000)
Chain.run(1_00_000)

defmodule KVServer do
  def accept(port) do
    {:ok, socket} = :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    IO.puts "Accepting connections on port #{port}"
    loop_acceptors(socket)
  end

  defp loop_acceptors(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    serve(client)
    loop_acceptors(socket)
  end

  defp serve(client) do
    client
    |> read_line
    |> write_line(client)

    serve(client)
  end

  defp read_line(client) do
    {:ok, line} = :gen_tcp.recv(client, 0)
    line
  end

  defp write_line(line, client) do
    :gen_tcp.send(client, line)
  end
end

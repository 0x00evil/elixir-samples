defmodule A do
  defmodule B do
    defstruct name: ""
  end

  def new(name: name) do
    %A.B{name: name}
  end
end

struct = A.new(name: "jay")
struct.name |> IO.puts

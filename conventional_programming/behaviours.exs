defmodule Parser do
  @callback parser(String.t) :: any
  @callback extensions() :: any
end

defmodule JSONParser do
  @bahaviour Parser

  def parser(str) do
    IO.puts(str <> " from #{__MODULE__}")
  end

  def extensions do
    IO.puts ".json"
  end
end

defmodule YAMLParser do
  @behaviour Parser

  def parser(str) do
    IO.puts(str <> " from #{__MODULE__}")
  end

  def extensions do
    IO.puts ".yaml"
  end
end

JSONParser.parser("Hello")
YAMLParser.parser("Hello")

JSONParser.extensions
YAMLParser.extensions

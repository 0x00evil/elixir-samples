defmodule ExampleOne do
  @author "花花太郎"

  def get_author do
    @author
  end
end

IO.puts "ExampleOne is written by #{ExampleOne.get_author}"

defmodule ExampleTwo do
  @attr "one"
  def first, do: @attr |> IO.puts
  @attr "two"
  def second, do: @attr |> IO.puts
end

ExampleTwo.first
ExampleTwo.second

defmodule ExampleOne do
  def func1 do
    List.flatten [1,[2,3],4]
    |> IO.inspect
  end

  def func2 do
    import List, only: [flatten: 1]
    flatten [5,[6,7],8]
    |> IO.inspect
  end
end

ExampleOne.func1
ExampleOne.func2

# defmodule ExampleTwo do
#   def func do
#     alias Mix.Tasks.Doctest, as: Doctest
#     doc = Doctest.setup
#     doc.run(Doctest.default)
#   end
# end

# ExampleTwo.func

# require

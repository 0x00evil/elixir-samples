# iterate over list
new_list = Enum.map([1, 2, 3], fn x -> x * 2 end)
new_list |> inspect |> IO.puts

# iterate over map
new_map = Enum.map(%{1 => 2, 3 => 4}, fn {k, v} -> k * v end)
new_map |> inspect |> IO.puts

# iterate over range
new_range = Enum.map(1..3, fn x -> x * 2 end)
new_range |> inspect |> IO.puts
sum = Enum.reduce(1..3, 0, &+/2)
sum |> IO.puts

# Enum.filter
odd? = &(rem(&1, 2) != 0)
odd_list = Enum.filter(1..10, odd?)
odd_list |> inspect |> IO.puts

# eager vs lazy
1..1_000_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum |> IO.puts
1..1_000_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum |> IO.puts

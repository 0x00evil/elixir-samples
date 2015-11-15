[1, 2, 3]

# 仅仅是[1, 2, 3]的tail pointer指向[4, 5, 6]就可以
IO.puts inspect([1, 2, 3] ++ [4, 5, 6])
IO.puts inspect([1, 2, 3, 4] -- [2, 4])
IO.puts 1 in [1, 2, 3, 4]
IO.puts "wombat" in [1, 2, 3, 4]

# keyword list(一定要加上inspect, 不然会报错)
IO.puts inspect([name: "dave", city: "dallas", likes: "programming"])

# 如果function call的最后一个argument是keyword list，那么允许省略掉最外层的方括号
# DB.save record, [{:user_transaction, true}, {:logging, "HIGH"}]
# DB.save record, {user:transaction, true}, {:logging, "HIGH"}
# DB.save record, user:transaction, true, :logging, "HIGH"

# list recursion
defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: [] # 这里不能是0
  def square([head | tail]), do: [ head*head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head+1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def sum_v1([], total), do: total
  def sum_v1([head | tail], total), do: sum_v1(tail, head+total)

  def sum_v2(list), do: _sum_v2(list, 0)
  defp _sum_v2([], total), do: total
  defp _sum_v2([head | tail], total), do: _sum_v2(tail, head+total)

  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def swap([]), do: []
  def swap([a, b | tail]), do: [b, a | swap(tail)]
  def swap(_), do: raise "Can't swap a list with an odd number of elements"
end

MyList.len([1,2,3])
# MyList.len [1,2,3] 这一行会报 no function clause matching
|> IO.puts

MyList.square([1,2,3])
# MyList.square [1,2,3], 如果是这样，打印出来的是[1,2,3]。看来缺少圆括号会产生很奇怪的错误
|> IO.inspect

MyList.add_1([1,2,3])
|> IO.inspect

MyList.map([1,2,3], fn (n) -> n*n*n end)
|> IO.inspect

MyList.map([1,2,3,4], fn (n) -> n > 2 end)
|> IO.inspect

MyList.sum_v1([1,2,3], 0)
|> IO.puts

MyList.sum_v2([1,2,3])
|> IO.puts

MyList.reduce([1,2,3], 0, &(&1 + &2))
|> IO.inspect

MyList.swap([1,2,3,4])
|> IO.inspect
# MyList.swap([1,2,3]) 抛出异常之后，之后的代码就无法执行了

# lists of list
defmodule WeatherHistoryV1 do
  def test_data do
    [
      [1366225622, 26, 15, 0.125],
      [1366225622, 27, 15, 0.45],
      [1366225622, 28, 21, 0.25],
      [1366229222, 26, 19, 0.081],
      [1366229222, 27, 17, 0.468],
      [1366229222, 28, 15, 0.60],
      [1366232822, 26, 22, 0.095],
      [1366232822, 27, 21, 0.05],
      [1366232822, 28, 24, 0.03],
      [1366236422, 26, 17, 0.025]
    ]
  end

  def for_location_27([]), do: []
  def for_location_27([[time, 27, temp, rain] | tail]) do
    [[time, 27, temp, rain] | for_location_27(tail)]
  end
  def for_location_27([ _ | tail]), do: for_location_27(tail)
end

WeatherHistoryV1.for_location_27(WeatherHistoryV1.test_data)
|> IO.inspect

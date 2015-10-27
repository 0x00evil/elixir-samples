[1,2,3,4,5,6]
|> Enum.map(&(&1 * &1)) # pipeline的写法，可能对于参数周围有没有圆括号，有要求
|> inspect
# |> Enum.with_index # 忘记这个API的作用了
|> IO.puts

# 以下是不使用pipline的写法, 就显得很麻烦
list = [1,2,3,4,5,6]
new_list = Enum.map(list, fn (x) -> x * x end)
IO.puts(inspect(new_list))

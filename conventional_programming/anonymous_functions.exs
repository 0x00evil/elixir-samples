# fn
#   parameter-list -> body
#   parameter-list -> body
# end
greet = fn -> IO.puts "Hello" end
greet.()

sum = fn (a, b) -> a + b end
IO.puts(sum.(1, 1)) # => 2

swap = fn {a, b} -> {b, a} end
# swap外面的圆括号不能省略
IO.puts(inspect(swap.({1,2})))
# pipleline的写法
swap.(1,2)
|> inspect
|> IO.puts

IO.puts(swap.({1, 2}) == {2, 1}) # 如何打印tuple？

# pattern match可以成功的两个条件：1,结构(structure)需要一致;2,value要一样
list = [1, 2, [3, 4, 5]]
[a, b, c] = list
IO.puts a
IO.puts b
IO.puts inspect(c)

# 以下是value不匹配，pattern match失败的例子
# list = [1, 2, 3]
# [a, 1, c] = list
# IO.puts a
# IO.puts c

# Elixir的pattern match，可以对同一variable绑定(bind)不同饿value，而Erlang的pattern match只能绑定一次
a = 1
IO.puts a # => 1
a = 2
IO.puts a # => 2

# 虽然Elixir中的variable可以多吃bind vlaue，但是一次match中，只能bind一次
[a, a] = [1, 1]
IO.puts a
# [a, a] = [1, 2]
# IO.puts a

# 如果不想要多次bind value，那么可以使用^
a = 1
^a = 1 # true
# ^a = 2 # false

# match on ranges(目前还不是特别了解Elixir中的range的原理)
a..b = 1..10
IO.puts a
IO.puts b

# 使用underscore(_)忽略某些值，看以看成是一个placeholder，Golang里面也有相似的用法
[1, _, _] = [1, 2, 3]
[1, _, _] = [1, "cat", "dog"]

# 总结，在Elixir中，= 应该被看做是equal，而不是assignment

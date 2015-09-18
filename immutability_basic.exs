# 在variable是mutable的语言当中，list2里面的value是由list1里面的value复制过来的
# 而在Elixir中，因为知道list1是immutable的，所以，Elixir仅仅是创创建了一个head是4，tail是list是list1的list（应该是指针直接指过去的）
list1 = [3, 2, 1]
list2 = [4 | list1]
IO.puts inspect(list2)

# 在transformational language里面，会留下很多unused variable(因为所有的variable产生了就不会再变了)
# 但是，因为Elixir的process都是隔离的，而且足够小，所以，看以把每一个process看成是在自己的heap上
# GC还是挺快的

# immutability更加直接的例子
name = "elixir"
cap_name = String.capitalize name
IO.puts name # value并没有发生变化
IO.puts cap_name

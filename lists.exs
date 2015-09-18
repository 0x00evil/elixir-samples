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

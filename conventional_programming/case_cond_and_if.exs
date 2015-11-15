# normal case example
case {1, 2, 3} do
  {4, 5, 6} ->
    IO.puts "This clause won't match"
  {1, x, 3} ->
    IO.puts "This clause will match and bind x to 2 in this clause"
  _ ->
    IO.puts "This clause will match any value"
end

# pattern match against an existing value, you need to use ^ operator
x = 1
case 10 do
  ^x -> IO.puts "won't match"
  _ -> IO.puts "will match"
end

# extra conditions with guards
case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "will match"
  _ ->
    "Would match, if guard condition were not satisfied"
end

# cond, check different values
cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    IO.puts "But this will"
end

# if/2 and unless/2 is useful when you need to check for just one condition
# do: IO.puts "true part"如果这样写，就报错。这种写法的跟下面的那种有什么区别？
# 区别就在这里的圆括号
if 1 === 1, do: (IO.puts "true fucking part"), else: ("false part")

if 1 === 1 do
  IO.puts "true part"
else
  IO.puts "false part"
end

unless 1 === 2, do: "true part", else: "false part"

unless 1 === 2 do
  IO.puts "true part"
else
  IO.puts "false part"
end

# a typical tuple has two to four elements
{1, 2}

{:ok, 42, "next"}

# 在pattern match中使用tuple
{status, count, action} = {:ok, 42, "next"}
IO.puts status
IO.puts count
IO.puts action

# 打开一个文件
{status, file} = File.open("nonexist")
IO.puts status
IO.puts file

# 注：tuple很像是mainstream language里面的Array

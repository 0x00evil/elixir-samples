IO.puts "Hello  world"
IO.puts :stderr, "hello world"

choice = IO.gets "yes or no?"
IO.puts choice

# by default, files opened in binary mode
{:ok, file} = File.open "hello", [:write]
IO.binwrite file, "world"
File.close file

# read a file。这里还是那个问题，如何打印tuple的value!!!
File.read("hello")
# throw an exception
# File.read! "unknown"

# path module
IO.puts Path.join("foo", "bar")
IO.puts Path.expand("~/hello")

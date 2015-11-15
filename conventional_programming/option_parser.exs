OptionParser.parse(["--debug"])
|> inspect
|> IO.puts

OptionParser.parse(["--source", "lib"])
|> inspect
|> IO.puts

OptionParser.parse(["--source-path", "lib", "test/enum_test.exs", "--verbose"])
|> inspect
|> IO.puts

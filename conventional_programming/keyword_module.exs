Keyword.fetch([a: 1], :a )
|> inspect
|> IO.puts

Keyword.fetch([a: 1], :b)
|> inspect
|> IO.puts

Keyword.fetch!([a: 1], :b)
|> inspect
|> IO.puts

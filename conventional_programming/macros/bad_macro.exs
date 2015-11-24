defmodule My1 do
  def myif(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)
    IO.puts("begin...")
    IO.puts(condition)
    IO.inspect(do_clause)
    IO.inspect(else_clause)
    IO.puts("end...")


    case condition do
      false -> else_clause
      _ -> IO.inspect(do_clause)
    end
  end
end

# 在My1.myif在执行之前，会先执行那两个IO.puts
My1.myif(1 == 1, do: IO.puts("true part"), else: IO.puts("false part"))

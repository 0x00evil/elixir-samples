defmodule Control do
  defmacro myif(expr, do: if_block) do
    quote do
      if unquote(expr) do
        unquote(if_block)
      else
        "you're fucking wrong"
      end
    end
  end

  defmacro myif(expr, do: if_block, else: else_block) do
    # else_block |> inspect |> IO.puts
    quote do
      case unquote(expr) do
        result when result in [false, nil] -> unquote(else_block)
        _ -> unquote(if_block)
      end
    end
  end
end

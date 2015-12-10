defprotocol Blank do
  @doc "Return true if data is considered blank/empty"
  @fallback_to_any true

  def blank?(data)
end

defimpl Blank, for: Any do
  def blank?(_), do: false
end

defimpl Blank, for: Integer do
  def blank?(_), do: false
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 9
end

defimpl Blank, for: Atom do
  def blank?(false), do: true
  def blank?(nil), do: true
  def blank?(_), do: false
end

Blank.blank?(0)
|> IO.puts

Blank.blank?([])
|> IO.puts

Blank.blank?([1,2,3])
|> IO.puts

Blank.blank?("hello")
|> IO.puts

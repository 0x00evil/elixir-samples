Regex.run %r/[aeiou]/, "caterpillar"

Regex.scan %r/[aeiou]/, "caterpillar"

"HELLO" =~ ~r/hello/ # return false
"HELLO" =~ ~r/hello/i # modifier example; return true

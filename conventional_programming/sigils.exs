# 8 different delimiters for regular expression
~r/hello/
~r|hello|
~r"hello"
~r'hello'
~r(hello)
~r[hello]
~r{hello}
~r<hello>

# strings
~s(this is a string with "double" quotes, not 'single' ones)

# char list
~c(this is a char list with 'single quotes')

# word lists
~w(bar foo bat)
~w(bar foo bat)a
~w(bar foo bat)s
~w(bar foo bat)c

# uppercase sigils to deal with escaping characters and interolation
# while both ~s and ~S return strings, the former allows escape codes and interpolation while the latter does not
~s(String with escape codes \x26 #{"inter" <> "polation"})
~S(String without escape codes and without #{interpolation})

# heredocs
~s"""
this is
a heredoc string
"""

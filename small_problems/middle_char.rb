=begin
Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument.
If the argument has an odd length, you should return exactly one character.
If the argument has an even length, you should return exactly two characters

- given a non-empty string
- return the middle char or chars
- middle char:
  - if string size even
      - middle 2 chars
  - if string size odd
      - middle single char

'I love ruby' -> size/2 = 11/2 = 5 -> e
Launch School -> size/2 = 11/2 = 5 -> ' '
Launch -> 6/2 = 3 -> chars on index 2..3
Launchschool -> 12/2 = 6 -> char on index 5..6
x -> 1/2 = 0

size is odd return the char at index size/2
size if even return the chars from size/2 - 1 to size/2

given a nonempty string
- get the size of the string
- get middle = size/2
- if size is odd
  - return char at index size/2
- otherwise
  - return chars from size/2-1..size/2
=end

def center_of(str)
  str_size = str.size

  middle = str_size/2

  if str_size.odd?
    return str[middle]
  else
    return str[(middle-1)..middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
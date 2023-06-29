=begin
- given a string that is encripted by ROT-13
- return the deciphered string
- ROT-13
  

Algo:

input: a string with spaces and special chars
output: a string with spaces and special chars

- create two arrays
  - list of lowercase alphabet chars
  - list of uppercase alphabet chars
- create an empty string result
- iterate through the chars in the given string
  - if current_char is included in first list
    - append the char with current index + 13 in the first list
  - else if it is included in second list
    - append the char with current index + 13 in the second list
  - else
    - append the current char
- return the result string
=end

def rot_13(encrypted_name)
  UPPERCASE = ('A'..'Z').to_a.reverse + 
end
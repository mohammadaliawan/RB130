=begin
given a string
reverse the string
return true if reversed string is equal to given string
false otherwise

Reverse the string

- get the string length
- get the middle index of the string
  - even length - size/2
  - odd length - size/2 + 1

Algo:

- Given a string
- initialize a new string
- iterate through the chars in the string in reverise order
  - append the current char to the new string

- 
"Hello" -> "olleH"
"Launch" -> "hcnuaL"

=end

# def reverse(arg)
#   reversed_arg = []

#   index = -1

#   while index >= -arg.size
#     reversed_arg << arg[index]
#     index -= 1
#   end

#   reversed_arg
# end

# def palindrome?(arg)
#   arg_array = []
#   arg.size.times do |index|
#     arg_array << arg[index]
#   end

#   arg_array == reverse(arg)
# end

def real_palindrome?(str)
  new_str = str.downcase.delete('^a-z0-9')
  new_str == new_str.reverse
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
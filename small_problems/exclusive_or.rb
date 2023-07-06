=begin
|| -> returns a truthy value if either are true or both are truthy,
if both are false then returns false
&& -> returns a truthy value if both are true

Only one of the conditions is truthy - Exclusive OR

wrtie a method xor
- takes two arguments
- returns true if exactly one argument is truthy
- false otherwise
- return only booleans not truthy or falsey values

if arg1 && (arg2 == false || arg2 == nil)
  true
elsif arg2 && (arg1 == false || arg1 == nil)
  true
else
  false
end

=end



def xor?(arg1, arg2)
  # if arg1 && (arg2 == false || arg2 == nil)
  #   true
  # elsif arg2 && (arg1 == false || arg1 == nil)
  #   true
  # else
  #   false
  # end

  return true if arg1 && !arg2
  return true if arg2 && !arg1

  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
=begin
- given a string that is encripted by ROT-13
- return the deciphered string
- ROT-13
  

Algo:

input: a string with spaces and special chars
output: a string with spaces and special chars

- Given an array of strings encrypted with ROT-13
- iterate through the array of strings
  - decrypt current string
  - output the deciphered string
- decryption
  - create a result empty string
  - iterate thru the chars in the string
      if current char is between a..m or A..M
        save current char + 13 to result string
      else if current char is between n..z or N..Z
        save current char - 13 to result string
      otherwise
        save current char to result string
=end

ENCRYPTED_PIONEERS = [
    'Nqn Ybirynpr',
    'Tenpr Ubccre',
    'Nqryr Tbyqfgvar',
    'Nyna Ghevat',
    'Puneyrf Onoontr',
    'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
    'Wbua Ngnanfbss',
    'Ybvf Unvog',
    'Pynhqr Funaaba',
    'Fgrir Wbof',
    'Ovyy Tngrf',
    'Gvz Orearef-Yrr',
    'Fgrir Jbmavnx',
    'Xbaenq Mhfr',
    'Fve Nagbal Ubner',
    'Zneiva Zvafxl',
    'Lhxvuveb Zngfhzbgb',
    'Unllvz Fybavzfxv',
    'Tregehqr Oynapu'
  ].freeze

def decipher(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                          encrypted_char
  end
end

def rot_13(encrypted_name)
  encrypted_name.each_char.reduce('') do |result, char|
    result + decipher(char)
  end
end

ACTUAL_NAMES = ENCRYPTED_PIONEERS.map do |encrypted_name|
  rot_13(encrypted_name)
end

puts ACTUAL_NAMES
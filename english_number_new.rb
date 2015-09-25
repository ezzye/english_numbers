# def english_number number
#   if number < 0
#     return 'Please enter a number that isn\'t negative you numskull!'
#   end
#   if number == 0
#     return 'zero'
#   end
#   num_string = ''

#   ones_place = ['one', 'two', 'three',
#                 'four', 'five', 'six',
#                 'seven', 'eight', 'nine']
#   tens_place = ['ten', 'twenty', 'thirty',
#                 'forty', 'fifty', 'sixty',
#                 'seventy', 'eighty', 'ninety']
#   teenagers = ['eleven', 'twelve', 'thirteen',
#               'fourteen', 'fifteen', 'sixteen',
#               'seventeen', 'eighteen', 'nineteen']
#   left = number
#   write = left/100
#   left = left - write*100

#   if write >0
#     hundreds = english_number write
#     num_string = num_string + hundreds + ' hundred'
#     if left > 0
#       num_string = num_string + ' '
#     end
#   end

#   write = left/10
#   left = left - write*10

#   if write >0
#     if ((write == 1) and (left > 0))
#       num_string = num_string + teenagers[left-1]
#     else
#       num_string = num_string + tens_place[write-1]
#     end

#     if left > 0
#       num_string = num_string + '-'
#     end
#   end

#   write = left
#   left = 0

#   if write > 0
#     num_string = num_string + ones_place[write-1]
#   end

#   num_string
# end


# puts english_number(  0)
# puts english_number(  9)
# puts english_number( 10)
# puts english_number( 11)
# puts english_number( 17)
# puts english_number( 32)
# puts english_number( 88)
# puts english_number( 99)
# puts english_number(100)
# puts english_number(101)
# puts english_number(234)
# puts english_number(3211)
# puts english_number(999999)
# puts english_number(1000000000000)

# def english_number_small_v1 number
#   ones = %w(zero one two three four five six seven eight nine)
#   tens = %w(zeor ten twenty thirty forty fifty sixty seventy eighty ninety)
#   teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)


#   result = ''
#   num_of_hundreds = number/100
#   result = result + ones[num_of_hundreds] + ' hundred '

#   number = number - num_of_hundreds*100

#   if number >= 20
#     num_of_tens =number/10
#     result = result + tens[num_of_tens] + ' '
#     num_of_units = number % 10
#     result = result + ones[num_of_units]
#   elsif number >=10 && number <= 19
#     num_of_teens = number - 10
#     result = result + teens[num_of_teens]
#   elsif number > 0
#     num_of_units = number
#     result = result + ones[num_of_units]
#   end

# return result  #check for space as last character

# end

def english_number_small number
  return 'zero ' if number == 0
  ones = ['','one','two','three','four','five','six','seven','eight','nine']
  tens = %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)
  teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  result = ''
  num_of_hundreds = number/100
  if num_of_hundreds > 0
    result += ones[num_of_hundreds] + ' hundred '
    number -= num_of_hundreds*100
  end
  if number >= 20
    result += tens[number/10] + ' ' + ones[number % 10] + ' '
  elsif number >=10 && number <= 19
    result += teens[number - 10] + ' '
  elsif number > 0
    result += ones[number] + ' '
  end
  result.gsub!('  ',' ')
  result
end


def english_number number

  result = ""

  namesOfBigNumbers = {
                      0 => "",
                      1 => "thousand",
                      2 => "million",
                      3 => "billion"
                    }

  findMultiples(number).each do |key,value|
    if value != 0
    result = english_number_small(value)  + namesOfBigNumbers[key] + " " + result
    else
    end
  end

  result

end


def findMultiples number
  multiplesOfThree = (number.to_i.to_s.length / 3)

  numberHash = {}

  left = number

  (0..multiplesOfThree).each do |index|
      numberHash[index] = left%1000
    left = left / 1000
  end
  numberHash
end


p english_number 99222178

# (0..99).each do |number|
#   p english_number_small number
# end

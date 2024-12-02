######
#
# Solution using sliding window
#
######
# @param {String} s
# @return {Integer}
require 'set'

def length_of_longest_substring_1(s)
  n = s.length
  max_length = 0
  char_set = Set.new
  left = 0

  (0...n).each do |right|
    if !char_set.include?(s[right])
      char_set.add(s[right])
      max_length = [max_length, right - left + 1].max
    else
      while char_set.include?(s[right])
        char_set.delete(s[left])
        left += 1
      end

      char_set.add(s[right])
    end
  end

  max_length
end

s = "pwwkew"
puts length_of_longest_substring_1(s)

######
#
# Solution using checking each character
#
######
# @param {String} s
# @return {Integer}
def length_of_longest_substring_2(s)
  ans = 0
  chars = s.chars
  length = 0

  chars.each_with_index do |ch, i|
    temp = ""
    temp += ch
    counter = i + 1
    sum = 1
    
    while(chars[counter] != nil && !(temp.include?(chars[counter])))
        temp += chars[counter]
        counter += 1
        sum += 1
    end

    if sum > ans
      ans = sum
    end
  end
  
  ans
end

s = "pwwkew"
puts length_of_longest_substring_2(s)

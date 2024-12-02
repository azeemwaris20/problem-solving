# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
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
puts length_of_longest_substring(s)

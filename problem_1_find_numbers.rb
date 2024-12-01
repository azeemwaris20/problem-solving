######
#
# Using one loop O(n)
#
######

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_1(nums, target)
  seen = {}
  [*(0..(nums.length-1))].each do |i|
    diff = target - nums[i]
    if seen.keys.include?(diff)
      return [seen[diff], i]
    else
      seen[nums[i]] = i
    end
  end
end

nums = [2,7,11,15]
target = 9
puts two_sum_1(nums, target).inspect

######
#
# Using two loops O(n²)
#
######

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum_2(nums, target)
  length = nums.size
  [*(0..length - 1)].each do |i|
    [*(1..length - 1)].each do |j|
      if i != j && nums[i] + nums[j] == target
        return [i, j]
      end
    end
  end
end

nums = [3,2,4]
target = 6
puts two_sum_2(nums, target).inspect

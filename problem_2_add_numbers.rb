# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode} ans

######
#
# Solution starts from here
#
######

def add_two_numbers(l1, l2)
  div = 0
  ans = nil

  while (l1 != nil || l2 != nil)
    if l1 == nil
      val1 = 0
    else
      val1 = l1.val
    end

    if l2 == nil
      val2 = 0
    else
      val2 = l2.val
    end

    sum = val1 + val2 + div
    div = 0
    ln = nil

    if sum <= 9
      ln = ListNode.new(sum, nil)
    else
      rem = sum % 10
      div = sum / 10
      ln = ListNode.new(rem, nil)
    end

    if ans == nil
      ans = ln
    else
      ans.add_new_node(ln)
    end

    if l1 != nil
      l1 = l1.next
    end

    if l2 != nil
      l2 = l2.next
    end
  end

  if div != 0
    ln = ListNode.new(div, nil)
    ans.add_new_node(ln)
  end

  ans
end

class ListNode
  def add_new_node(ln)        
    last = self

    while last.next != nil
      last = last.next
    end
    last.next = ln
  end
end

l1 = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
l2 = ListNode.new(5, ListNode.new(6, ListNode.new(4)))

result = add_two_numbers(l1, l2)
puts result.inspect

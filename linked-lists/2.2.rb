class ListNode
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def append(value)
    current = self
    while current.next_node != nil
      current = current.next_node
    end

    current.next_node = ListNode.new(value)
  end
end

head = ListNode.new 0

(1..6).each {|value| head.append value }

def kth_to_last(node, k)
  if node.nil?
    return { calls_left: k - 1 }
  end

  stack_data = kth_to_last(node.next_node, k)

  if stack_data.class == Integer
    return stack_data
  elsif stack_data[:calls_left] < 1
    return node.data
  else
    return { val: node.data, calls_left: stack_data[:calls_left] - 1 }
  end
end

puts kth_to_last head, 3

def kth_to_last_iter(head, k)
  lead = head
  tail = head

  while k > 0
    lead = lead.next_node
    k -= 1
  end

  until lead.nil?
    lead = lead.next_node
    tail = tail.next_node
  end

  tail.data
end

puts kth_to_last_iter head, 3

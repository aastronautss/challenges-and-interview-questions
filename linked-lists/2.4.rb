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

head = ListNode.new 3

[5, 8, 5, 10, 2, 1].each { |val| head.append val }

part_value = 5

def partition(node, part_value)
  current = node
  left_part = nil
  right_part = nil

  until current.nil?
    if current.data < part_value
      left_part = create_or_append left_part, current.data
    else
      right_part = create_or_append right_part, current.data
    end
  end

  left_part.append right_part
  left_part
end

def create_or_append(node, data)

end


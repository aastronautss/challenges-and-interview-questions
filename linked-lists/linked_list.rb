class ListNode
  attr_accessor :val, :next_node

  def initialize(val = nil, next_node = nil)
    @val = val
    @next_node = next_node
  end

  def append(value)
    current = self
    while current.next_node != nil
      current = current.next_node
    end

    current.next_node = value.is_a? ListNode ? value : ListNode.new(value)
  end
end

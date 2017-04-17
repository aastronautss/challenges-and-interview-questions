class BinaryTreeNode
  attr_accessor :val, :left, :right

  def initialize(val = nil)
    @val = val
  end

  def binary_insert(new_val)
    if new_val < @val
      if @left.nil?
        @left = BinaryTreeNode.new new_val
        return @left
      else
        @left.binary_insert new_val
      end
    elsif @val < new_val
      if @right.nil?
        @right = BinaryTreeNode.new new_val
        return @right
      else
        @right.binary_insert new_val
      end
    end
  end
end

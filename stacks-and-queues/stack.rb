class Stack
  def initialize
    @values = []
  end

  def push(val)
    @values << val
  end

  def pop
    @values.pop
  end

  def peek
    @values.last
  end
end

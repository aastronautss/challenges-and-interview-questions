class TheQueue
  def initialize
    @values = []
  end

  def enqueue(val)
    @values << val
  end

  def dequeue
    @values.shift
  end

  def size
    @values.size
  end
end

require_relative './stack'
require_relative './queue'

# Build a queue from two stacks

class QueueOfStacks
  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
  end

  def enqueue(val)
    @stack1.push val
  end

  def dequeue
    until @stack1.peek.nil?
      @stack2.push @stack1.pop
    end

    val = @stack2.pop

    until @stack2.peek.nil?
      @stack1.push @stack2.pop
    end

    val
  end
end

# Build a stack from two queues

class StackOfQueues
  def initialize
    @queue1 = TheQueue.new
    @queue2 = TheQueue.new
  end

  def push(value)
    @queue1.enqueue value
  end

  def pop
    until @stack1.size <= 1
      @stack2.enqueue @stack1.dequeue
    end

    val = @stack1.dequeue

    @stack1, @stack2 = @stack2, @stack1

    val
  end
end

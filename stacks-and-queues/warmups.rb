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

# Write a function that takes a string and returns true if its parens,
# brackets, and braces are valid.

def valid_parens(str)
  brackets = []
  open_brackets = ['(', '[', '{']
  close_brackets = [')', ']', '}']
  pairs = Hash[open_brackets.zip close_brackets]

  str.chars.each do |char|
    if open_brackets.include? char
      brackets << char
    elsif close_brackets.include? char
      open_bracket = brackets.pop
      return false unless pairs[open_bracket] == char
    end
  end

  true
end

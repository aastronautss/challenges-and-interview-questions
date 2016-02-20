require 'pry'

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(length)
    @length = length
    @queue = []
  end

  def read
    raise BufferEmptyException if empty?
    @queue.shift
  end

  def write(data)
    return if data.nil?
    raise BufferFullException if full?
    @queue << data
  end

  def write!(data)
    return if data.nil?

    if full?
      @queue[0] = data
      @queue << @queue.shift
    else
      write data
    end
  end

  def clear
    @queue = []
  end

  def full?
    @queue.length == @length
  end

  def empty?
    @queue.empty?
  end
end

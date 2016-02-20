require 'pry'

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
  class InvalidSizeException < StandardError; end

  attr_accessor :size

  def initialize(size)
    raise InvalidSizeException, "Size must be positive!" if invalid_size?(size)
    @size = size
    init_buffer
  end

  def read
    raise BufferEmptyException, "The buffer is empty!" if @current.empty?
    data = @current.read
    iterate
    data
  end

  def write(data)
    node_to_write = next_empty
    node_to_write.write data
  end

  def clear
    start = @current
    loop do
      @current.clear
      iterate
      break if @current == start
    end
  end

  def list_buffer
    node_to_print = @current
    loop do
      p node_to_print.data
      node_to_print = node_to_print.next_node
      break if node_to_print == @current
    end
  end

  private

  class BufferNode
    attr_accessor :data, :next_node

    def initialize
      @data = nil
      @next_node = nil
    end

    def read
      read_data = @data
      @data = nil
      read_data
    end

    def write(write_data)
      @data = write_data
    end

    def clear
      @data = nil
    end

    def empty?
      @data.nil?
    end
  end

  def invalid_size?(size)
    size < 1
  end

  def iterate
    @current = @current.next_node
  end

  def init_buffer
    first_node = BufferNode.new
    new_node = first_node

    @size.times do
      new_node ||= BufferNode.new

      if @current.nil?
        @current = new_node
      else
        @current.next_node = new_node
        iterate
      end

      new_node = nil
    end

    @current.next_node = first_node
  end

  def next_empty
    result = @current
    until result.empty?
      result = result.next_node
    end
    result
  end
end

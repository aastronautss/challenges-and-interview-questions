class StackWithMin
  def initialize
    @data = []
    @mins = []
  end

  def push(val)
    if @mins.size == 0 || val <= @mins.last
      @mins.push val
    end

    @data.push val
  end

  def pop
    @mins.pop if @mins.last == @data.last
    @data.pop
  end

  def min
    @mins.last
  end

  def peek
    @data.last
  end
end

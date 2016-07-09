class Triangle
  attr_reader :rows

  def initialize(num_rows)
    raise ArgumentError, "number of rows must be positive" if num_rows < 1
    @rows = fill_rows num_rows
  end

  def last
    @rows.last
  end

  private

  def fill_rows(num_rows)
    (1..num_rows).each_with_object([]) do |_, ary|
      ary << next_row(ary[-1])
    end
  end

  def next_row(prev_row)
    if !prev_row
      [1]
    else
      ([0] + prev_row + [0]).each_cons(2).map { |x, y| x + y }
    end
  end
end

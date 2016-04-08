class SumOfMultiples
  def initialize(a = 3, b = 5, *ary)
    ary += [a, b]
    @tracker = Hash[ary.map { |num| [num, 0] }]
  end

  def to(max)
    sum = 0
    while incrementors_under? max
      sum += next_multiple!
    end
    sum
  end

  def self.to(max)
    self.new.to(max)
  end

  private

  def incrementors_under?(max)
    @tracker.values.any? { |val| val < max }
  end

  def next_multiple!
    lowest = @tracker.values.min
    @tracker.each do |key, multiple|
      @tracker[key] += key if multiple == lowest
    end
    lowest
  end
end

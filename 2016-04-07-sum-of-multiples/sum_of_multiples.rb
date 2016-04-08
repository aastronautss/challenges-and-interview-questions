require 'pry'

class SumOfMultiples
  def initialize(a = 3, b = 5, *ary)
    ary += [a, b]
    @nums = ary
  end

  def to(max)
    (1...max).inject(0) do |sum, num|
      multiple?(num) ? sum + num : sum
    end
  end

  def self.to(max)
    self.new.to(max)
  end

  private

  def multiple? potential_multiple
    @nums.any? { |num| potential_multiple % num == 0 }
  end
end

class Palindromes
  attr_accessor :max_factor, :min_factor
  def initialize(args)
    @max = args[:max_factor] || 1
    @min = args[:min_factor] || 1
  end

  def generate
    @pals = (@min..@max).to_a.each_with_object([]) do |num1, array|
      (num1..@max).to_a.each do |num2|
        array << [num1, num2] if palindrome?(num1 * num2)
      end
    end
  end

  def largest
    PalPairing.new(@pals[-1])
  end

  def smallest
    PalPairing.new(@pals[0])
  end

  class PalPairing
    def initialize(pair)
      @pair = pair
    end

    def value
      @pair.inject :*
    end
  end

  private

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end

  def get_pairs

  end
end

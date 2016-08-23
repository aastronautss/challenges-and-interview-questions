class Palindromes
  attr_reader :largest, :smallest

  def initialize(opts)
    @max_factor = opts[:max_factor]
    @min_factor = opts[:min_factor] || 1

  end

  def generate
    combinations = (@min_factor..@max_factor).to_a.repeated_combination 2
    @palindromes = combinations.each_with_object({}) do |combination, hash|
      product = combination.inject(:*)
      if palindrome? product
        hash[product] ||= []
        hash[product] << combination
      end
    end

    @largest = select :max
    @smallest = select :min
  end

  class PalindromeFactors
    attr_reader :value, :factors

    def initialize(value, factors)
      @value = value
      @factors = factors
    end
  end

  private

  def select(method)
    key = @palindromes.keys.send method
    PalindromeFactors.new key, @palindromes[key]
  end

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end

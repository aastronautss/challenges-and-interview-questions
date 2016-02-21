require 'pry'

class Octal
  def initialize(oct_number)
    @digits = oct_number.split('')
    validate_digits
  end

  def to_decimal
    reverse_digits = @digits.reverse
    reverse_digits.each_with_index.inject(0) do |sum, (value, power)|
      sum += value * 8**power
    end
  end

  private

  VALID_DIGITS = ('0'..'7')

  attr_accessor :digits

  def validate_digits
    @digits = [0] unless @digits.all? { |digit| VALID_DIGITS.include? digit }
    @digits.map!(&:to_i)
  end
end

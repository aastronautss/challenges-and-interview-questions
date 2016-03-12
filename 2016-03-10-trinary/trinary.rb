class Trinary
  VALID_DIGITS = ('0'..'2')

  def initialize(num)
    @num = num.split ''
  end

  def to_decimal
    if valid?
      reverse_digits = @num.reverse
      reverse_digits.each_with_index.inject(0) do |sum, (value, power)|
        sum += value.to_i * 3**power
      end
    else
      0
    end
  end

  def valid?
    @num.all? { |digit| VALID_DIGITS.include? digit }
  end
end

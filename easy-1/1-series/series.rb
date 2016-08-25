class Series
  def initialize(str)
    @digits = str.chars.map &:to_i
  end

  def slices(length)
    raise ArgumentError if length > @digits.length

    @digits.each_index.map do |index|
      @digits[index..(index + length - 1)]
    end[0..(@digits.length - length)]
  end
end

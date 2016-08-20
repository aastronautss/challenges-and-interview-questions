class RailFenceCipher
  def self.encode(plaintext, num_rails)
    chars = plaintext.chars
    fill_rails(chars, num_rails).join
  end

  def self.decode(ciphertext, num_rails)
    text = ciphertext.clone
    slots = fill_rails(0...text.length, num_rails)

    mapping = slots.map do |rail|
      chars = text.slice!((0...rail.length)).split ''
      Hash[rail.zip(chars)]
    end.inject(:merge)

    mapping.each_with_object([]) do |(index, char), chars|
      chars[index] = char
    end.join
  end

  private

  def self.fill_rails(array, num_rails)
    rails = Array.new(num_rails) { Array.new }
    osc = Oscillator.new(num_rails)

    array.each_with_index do |member, index|
      rail = osc.next_value
      rails[rail] << member
    end

    rails
  end

  class Oscillator
    def initialize(size, starting_index = 0)
      @start = starting_index
      @end = @start + size - 1
      @current_value = @start

      @direction = up
    end

    def next_value
      return 0 if @start - @end == 0

      if @current_value <= @start
        @direction = up
      elsif @current_value >= @end
        @direction = down
      end

      result = @current_value
      @current_value += @direction
      result
    end

    private

    def up
      1
    end

    def down
      -1
    end
  end
end

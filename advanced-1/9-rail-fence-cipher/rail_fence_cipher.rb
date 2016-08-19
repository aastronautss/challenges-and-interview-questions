require 'pry'

class RailFenceCipher
  def self.encode(plaintext, num_rails)
    return plaintext if num_rails <= 1

    rails = Array.new(num_rails) { Array.new }

    plaintext.each_char.each_with_index do |char, index|
      rail = rail_position num_rails, index
      rails[rail] << char
    end

    rails.join
  end

  def self.decode(ciphertext, num_rails)

  end

  def self.rail_position(num_rails, index)
    cycle_length = 2 * num_rails - 2
    pos_in_cycle = index % cycle_length

    if pos_in_cycle <= num_rails - 1
      pos_in_cycle
    else
      # Determine the which rail on the "return trip" of the cycle.
      (num_rails - 2) - (pos_in_cycle - num_rails)
    end
  end

  # class Oscillator
  #   def initialize(size, starting_index = 0)
  #     @start = starting_index
  #     @end = @start + size
  #     @current_value = @start
  #   end

  #   def next_value
  #     up = 1
  #     down = -1
  #     direction = up
  #     if @current_value <= @start
  #       direction = up
  #     elsif @current_value >= @end
  #       direction = down
  #     end
  #     @current_value += direction
  #   end
  # end
end

# 2n - 2

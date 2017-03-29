class SecretHandshake
  COMMANDS = ['jump', 'close your eyes', 'double blink', 'wink'].reverse.freeze

  def initialize(num)
    @digits= num.to_i.to_s(2).chars
  end

  def commands
    result = @digits.reverse.each_with_index.map do |digit, idx|
      digit == '1' ? COMMANDS[idx] : nil
    end.compact

    result.reverse! if @digits.size > COMMANDS.size

    result
  end
end

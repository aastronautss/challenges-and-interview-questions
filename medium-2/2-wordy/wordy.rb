class WordProblem
  OPERATORS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied by' => :*,
    'divided by' => :/
  }

  def initialize(question)
    @elements = parse question
  end

  def answer
    initial = @elements[:digits][0]
    digits = @elements[:digits][1..-1]

    digits.each_with_index.inject(initial) do |result, (num, idx)|
      result.send @elements[:ops][idx], num
    end
  end

  private

  def parse(question)
    digits = question.scan(/-?\d+/).map &:to_i
    raise ArgumentError if digits.empty?

    ops = question.scan(/#{OPERATORS.keys.join('|')}/i).map do |str|
      OPERATORS[str]
    end
    raise ArgumentError if ops.empty?

    { digits: digits, ops: ops }
  end
end

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
    @elements[:ops].each_with_index.inject(@elements[:nums]) do |result, (op, idx)|
      result.send OPERATORS[op], @elements[:nums][idx + 1]
    end
  end

  private

  def parse(question)
    nums = question.scan(/-?\d+/).map &:to_i
    raise ArgumentError if nums.empty?

    ops = question.scan(/#{OPERATORS.keys.join('|')}/i)
    raise ArgumentError if ops.empty?

    { nums: nums, ops: ops }
  end
end

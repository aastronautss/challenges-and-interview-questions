class ParenDepth
  def self.calculate(str)
    current = 0
    max = 0

    str.split("").each do |letter|
      if letter == '('
        current += 1
        max = current > max ? current : max
      elsif letter == ')'
        current -= 1 if current > 0
      end
    end

    max
  end
end

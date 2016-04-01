class Prime
  def self.nth(n)
    raise ArgumentError if n < 1

    result = 1
    while n > 0
      result += 1
      n -= 1 if is_prime? result
    end

    result
  end

  private

  def is_prime?(num)
    return true if [2, 3].include? num
    return false if num % 2 == 0 || num % 3 == 0

    i = 5
    while i* i <= num
      return false if num % i == 0 || num % (i + 2) == 0

      i += 6
    end

    true
  end
end

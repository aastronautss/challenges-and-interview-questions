class Prime
  def self.nth(n)
    raise ArgumentError if n < 1

    result = 1
    while n > 0 do
      result += 1
      n -= 1 if is_prime? result
    end

    return result
  end

  private

  def is_prime?(n)
    return true if n == 2
    return false if n % 2 == 0

    (3..Math.sqrt(n)).each do |divisor|
      return false if n % divisor == 0
    end
    true
  end
end

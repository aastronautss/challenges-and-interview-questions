class Cipher
  attr_reader :key

  def initialize(key = generate_key)
    raise ArgumentError unless key.match /^[a-z]+$/
    @key = key
  end

  def encode(plaintext)
    shift plaintext, :+
  end

  def decode(ciphertext)
    shift ciphertext, :-
  end

  private

  def shift(text, op)
    text.chars.each_with_index.map do |char, index|
      distance = @key[key_index(index)].ord - 'a'.ord
      (((char.ord - 'a'.ord).send(op, distance)) % 26 + 'a'.ord).chr
    end.join
  end

  def key_index(index)
    index % key.length
  end

  def generate_key
    Array.new(100).map { ('a'..'z').to_a.sample }.join
  end
end

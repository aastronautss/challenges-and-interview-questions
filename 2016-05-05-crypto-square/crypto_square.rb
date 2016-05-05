class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.gsub(/[^\w]/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    normalize_ciphertext.gsub /\s+/, ''
  end

  def normalize_ciphertext
    segments = plaintext_segments.map do |segment|
      row = segment.split ''
      (0...size).each { |idx| row[idx] ||= nil }
      row
    end
    segments.transpose.map { |row| row.join('') }.join(' ')
  end
end

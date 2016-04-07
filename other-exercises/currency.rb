def to_currency(num)
  num = num.to_s
  raise ArgumentError unless num.match /^\d*\.?\d*$/

  num = num.to_f.round(2).to_s
  parts = num.split "."

  dollars = parts.shift
  dollars = dollars.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  result = "$#{dollars}"

  cents = parts.shift
  cents << "0" if cents.length < 2
  result << ".#{cents}"
end

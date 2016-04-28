def to_currency(num)
  num = num.to_s
  raise ArgumentError unless num =~ /^[-+]?(\d*[.])?\d+$/

  num = num.to_f.round(2).to_s
  dollars, cents = num.split "."

  dollars = dollars.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  result = "$#{dollars}"

  cents << "0" if cents.length < 2
  result << ".#{cents}"
end

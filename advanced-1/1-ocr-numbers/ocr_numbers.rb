require 'pry'

class OCR
  HEIGHT = 4
  WIDTH = 3
  DIGITS = {
    " _ \n"\
    "| |\n"\
    "|_|\n"\
    "   "    => '0',

    "   \n"\
    "  |\n"\
    "  |\n"\
    "   "    => '1',

    " _ \n"\
    " _|\n"\
    "|_ \n"\
    "   "    => '2',

    " _ \n"\
    " _|\n"\
    " _|\n"\
    "   "    => '3',

    "   \n"\
    "|_|\n"\
    "  |\n"\
    "   "    => '4',

    " _ \n"\
    "|_ \n"\
    " _|\n"\
    "   "    => '5',

    " _ \n"\
    "|_ \n"\
    "|_|\n"\
    "   "    => '6',

    " _ \n"\
    "  |\n"\
    "  |\n"\
    "   "    => '7',

    " _ \n"\
    "|_|\n"\
    "|_|\n"\
    "   "    => '8',

    " _ \n"\
    "|_|\n"\
    " _|\n"\
    "   "    => '9'
  }.freeze

  def initialize(text)
    @rows = text.split /\n/ # Call chomp here for cases beyond the
                            # given test cases.
    validate_input # Make sure we have the right number of rows.
    normalize_rows # Fill in blank spaces.
  end

  def convert
    parse_digits.map do |group|
      group.map { |text| DIGITS[text] || '?' }.join ''
    end.join ','
  end

  private

  def parse_digits
    segments.map do |segment|
      parse_segment segment
    end
  end

  def segments
    @rows.each_slice(HEIGHT).to_a
  end

  def parse_segment(segment)
    segment.map do |str|
      str.scan /.{3}/
    end.transpose.map do |slices|
      slices.join "\n"
    end
  end

  def normalize_rows
    @rows << '' # Add blank last row
    row_length = @rows.max_by { |row| row.length }.length
    @rows.map! do |row|
      row.ljust row_length
    end
  end

  def validate_input
    raise ArgumentError unless valid_row_amount?
  end

  def valid_row_amount?
    (@rows.size + 1) % HEIGHT == 0
  end
end

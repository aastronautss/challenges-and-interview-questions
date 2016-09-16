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
    segments_with_parsed_digits.map do |segment|
      # After digits are parsed out of the input, we map them onto the
      # character map that we define.
      segment.map { |text| DIGITS[text] || '?' }.join ''
    end.join ','
  end

  private

  # Each digit in the input is stored as a single string. Returns parsed
  # digits, divided up into segments.
  def segments_with_parsed_digits
    segments.map do |segment|
      parse_segment segment
    end
  end

  # Divide each line of input into arrays.
  def segments
    @rows.each_slice(HEIGHT).to_a
  end

  # Individual digits are parsed out of a line of input.
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
    # Since we `chomp`ed the last row off of our input, we need to compensate.
    (@rows.size + 1) % HEIGHT == 0
  end
end

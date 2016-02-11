require 'date'

class Meetup
  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]
  WDAYS = { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
            friday: 5, saturday: 6 }
  COUNTS = { first: 0, second: 1, third: 2, fourth: 3 }

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, nth)
    days = wday_dates(WDAYS[weekday])
    day_number = nil

    case nth
    when :teenth
      day_number = days.find { |day| TEENTH_DAYS.include? day }
    when :first
      day_number = days[0]
    when :second
      day_number = days[1]
    when :third
      day_number = days[2]
    when :fourth
      day_number = days[3] or days.last
    when :last
      day_number = days.last
    end

    Date.new(year, month, day_number)
  end

  # Credit to Owen Tran!
  def days_in_month
    Date.new(year, month, -1).day
  end

  def wday_dates(wday)
    (1..days_in_month).select do |day|
      Date.new(year, month, day).wday == wday
    end
  end
end

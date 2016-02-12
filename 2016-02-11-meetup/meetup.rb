require 'date'

class Meetup
  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]
  WDAYS = { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
            friday: 5, saturday: 6 } # Name refers to Date#wday method.
  COUNTS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  attr_reader :month, :year

  def initialize(month, year)
    @month = month
    @year = year
  end

  # Takes two symbols: one for the weekday, and the other refering to which
  # weekday in the month (first, third, etc.).
  # Returns the Date object refering to the exact date. E.g., The first friday
  # of February 2016 is the fifth.
  def day(weekday, nth)
    days = wday_dates(WDAYS[weekday])
    day_number = nil # I couldn't for the life of me think of a better name.

    if nth == :teenth
      day_number = days.find { |day| TEENTH_DAYS.include? day }
    else
      day_number = days[COUNTS[nth]] || days.last
    end

    Date.new(year, month, day_number)
  end

  private

  # Returns the number of days in the month (based on @month and @year)
  # Credit to Owen Tran on the challenge's discussion page!
  def days_in_month
    Date.new(year, month, -1).day
  end

  # Takes an integer refering to the day of the week (0 = Sunday, 6 = Saturday)
  # Returns an array of all the dates of that are that weekday in the month.
  # E.g., all days that are a Friday in a month.
  def wday_dates(wday)
    (1..days_in_month).select do |day|
      Date.new(year, month, day).wday == wday
    end
  end
end

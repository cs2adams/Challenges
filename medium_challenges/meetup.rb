require 'date'

class Meetup
  NUMBER_OF_WEEKS = {
      'first' => 1, 'second' => 2, 'third' => 3,
      'fourth' => 4, 'fifth' => 5
    }

  def initialize(year, month)
    self.year = year
    self.month = month
  end

  def day(day_of_week, criteria)
    day_of_week.downcase!
    criteria.downcase!

    case criteria
    when 'teenth' then teenth_day(day_of_week)
    when 'last'   then last_day(day_of_week)
    else               nth_day(day_of_week, criteria)
    end
  end

  private

  attr_accessor :year,:month

  def teenth_day(day_of_week)
    day = Date.civil(year, month, 1)
    until day.day >= 13 && is_desired_day?(day, day_of_week)
      day = day.next
    end

    day
  end
  
  def last_day(day_of_week)
    day = Date.civil(year, month + 1, 1).prev_day
    day = day.prev_day until is_desired_day?(day, day_of_week)
    day
  end  

  def nth_day(day_of_week, criteria)
    day = Date.civil(year, month, 1)
    wweeks_remaining = NUMBER_OF_WEEKS[criteria] - 1

    until is_desired_day?(day, day_of_week) && wweeks_remaining == 0
      wweeks_remaining -= 1 if is_desired_day?(day, day_of_week)
      day = day.next      
    end

    return nil if day.month != month
    day
  end

  def is_desired_day?(date, desired_day)
    date.send("#{desired_day}?")
  end
end
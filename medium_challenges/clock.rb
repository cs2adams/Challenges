class Clock
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def initialize(hour, minute)
    self.hour = hour
    self.minute = minute
  end

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def +(additional_minutes)
    new_clock(minute + additional_minutes)
  end

  def -(subtracted_minutes)
    new_clock(minute - subtracted_minutes)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  def to_s
    "#{format('%.2d', hour)}:#{format('%.2d', minute)}"
  end

  protected

  attr_reader :hour, :minute

  private

  def hour=(hr)
    raise ArgumentError, 'Argument not an integer' unless hr.is_a?(Integer)
    @hour = hr % HOURS_PER_DAY
  end

  def minute=(min)
    raise ArgumentError, 'Argument not an integer' unless min.is_a?(Integer)
    @minute = min % MINUTES_PER_HOUR
  end

  def new_clock(total_minutes)
    additional_hr, new_min = total_minutes.divmod(MINUTES_PER_HOUR)
    new_hr = hour + additional_hr
    Clock.new(new_hr, new_min)
  end
end

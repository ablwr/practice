require 'pry'
require 'time'
require 'date'

class BirthdayCalc

  def initialize(birthday)
    @birthday = birthday
    parsed_birthday = @birthday.split("/")
    @birth_month = parsed_birthday[0].to_i
    @birth_day = parsed_birthday[1].to_i
    @birth_year = parsed_birthday[2].to_i
  end

  def birthday?
    in_future?
    if @birth_month == Date.today.month && @birth_day == Date.today.day
      return true
    else
      false
    end
  end

  def age
    in_future?
    return 0 if birthday? == Date.today
    if ((@birth_month == Date.today.month) && (@birth_day > Date.today.day)) || ((@birth_month > Date.today.month))
      years_old = (Date.today.year - @birth_year) - 1
    else
      years_old = Date.today.year - @birth_year
    end
    years_old
  end

  def number_of_days
    in_future?
    if birthday?
      days_num = 0
    elsif ((@birth_month == Date.today.month) && (@birth_day > Date.today.day)) || ((@birth_month > Date.today.month))
      days_num = Date.new(Date.today.year,@birth_month,@birth_day)
    else
      days_num = Date.new(Date.today.year+1,@birth_month,@birth_day)
    end
    Date.new(Date.today.year,@birth_month,@birth_day) - Date.today
  end

  def in_future?
    if @birth_year > Date.today.year && @birth_month > Date.today.month && @birth_day > Date.today.day
      raise FutureError
    end
  end

end

class FutureError < StandardError
end
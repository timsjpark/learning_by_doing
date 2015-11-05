require_relative './helper_methods.rb'

# Comment
class SassyOven
  attr_reader :door

  def initialize
    @temp = 80
    @door = 'closed'
  end

  def temp
    "Temperature: #{@temp} °F"
  end

  def off
    'Your oven is now off.'
  end

  def open
    if @door == 'closed'
      @door = 'open'
    else
      'Are you blind? The door is already open!'
    end
  end

  def close
    if @door == 'open'
      @door = 'closed'
    else
      'Are you blind? The door is already closed!'
    end
  end

  def preheat(temp)
    if invalid_temp?(temp)
      print_error_message(temp)
    elsif difference_in_temperature?(temp)
      change_temperature(temp)
    end
  end

  def bake(timer)
    return 'Preheat the oven before trying to bake.' if @temp == 80
    timer_setting_output(timer)
  end

  def broil(timer)
    preheat(500)
    timer_setting_output(timer)
  end
end

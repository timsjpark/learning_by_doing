require_relative './sassy_oven.rb'

## .preheat helpers

def invalid_temp?(temp)
  temp <= 80 || @temp == temp
end

def difference_in_temperature?(temp)
  @temp != temp
end

def print_error_message(temp)
  if temp == @temp
    "Your oven is already holding at #{@temp} °F."
  elsif temp <= 80
    "This oven ain't a fridge! Pick a temperature above 80 °F."
  end
end

def change_temperature(temp)
  if temp > @temp
    @temp = temp
    "Your oven is now holding at #{@temp} °F."
  elsif temp < @temp
    @temp = temp
    "Your oven is now holding at #{@temp} °F."
  end
end

## .bake and .broil helpers

def timer_setting_output(timer)
  if timer > 0
    # sleep(timer / 10)
    'Your food is ready!'
  else
    "Hope you don't burn your food!"
  end
end

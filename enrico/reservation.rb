class Reservation
  attr_reader :rate
  REQUIRED_STOPS = 2

  def initialize(quoted_stops: quoted_stops, stops: [])
    @quoted_stops = quoted_stops
    @stops = stops
    define_rate
  end

  def recalculate_quote?
    @quoted_stops != @stops
  end

  def quoted_cost
    if insufficient_quoted_stops?
      raise InsufficientQuoteStopsError
    end
    @quoted_stops.length * @rate
  end

  def define_rate
    @rate = 50 if @quoted_stops.length <= 3
    @rate = 70 if @quoted_stops.length <= 5 && @quoted_stops.length >= 4
    @rate = 100 if @quoted_stops.length >= 6
  end

  private

    # intention revealing
    def insufficient_quoted_stops?
      @quoted_stops.length < REQUIRED_STOPS
    end

  class InsufficientQuoteStopsError < Exception
    def message
      "You must have at least two stops!"
    end
  end
end

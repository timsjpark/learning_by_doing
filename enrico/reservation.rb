class Reservation
  REQUIRED_STOPS = 2
  DOLLAR_AMOUNT_PER_STOP = 50

  def initialize(quoted_stops: quoted_stops, stops: [])
    @quoted_stops = quoted_stops
    @stops = stops
  end

  def recalculate_quote?
    @quoted_stops != @stops
  end

  def quoted_cost
    if insufficient_quoted_stops?
      raise InsufficientQuoteStopsError
    end
    @quoted_stops.length * DOLLAR_AMOUNT_PER_STOP
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

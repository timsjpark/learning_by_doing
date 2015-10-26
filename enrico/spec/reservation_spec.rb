require_relative '../reservation'

describe Reservation do

  describe "#recalculate_quote?" do
    context "with a quoted reservation" do
      let(:quoted_stops) { ['DIA', 'Pivotal Labs'] }
      let(:subject) { Reservation.new(quoted_stops: quoted_stops, stops: stops) }

      context "with driver stops matching the quoted trip" do
        let(:stops) { quoted_stops }
        it "doesn't need to recalculate the quote" do
          expect(subject.recalculate_quote?).to be(false)
        end
      end

      context "with stops not matching the quoted trip" do
        let(:stops) { ['DIA', 'McDonalds', 'Pivotal Labs'] }
        it "does need to recalculate the quote" do
          expect(subject.recalculate_quote?).to be(true)
        end
      end
    end
  end

  describe "#quoted_cost" do
    let(:subject) { Reservation.new(quoted_stops: quoted_stops) }

    context "with less then two stops" do
      # it should never happen

      # some people like to raise exception
      let(:quoted_stops) { ['DIA'] }
      it "should raise a Reservation::InsufficientQuoteStops" do
        expect { subject.quoted_cost }.to raise_error(Reservation::InsufficientQuoteStopsError,
                                                      "You must have at least two stops!")
      end
    end

    context "with two stops" do
      let(:quoted_stops) { ['DIA', 'Pivotal Labs'] }
      it "should be 100$" do
        expect(subject.quoted_cost).to eq(100)
      end
    end

    context "with three stops" do
      let(:quoted_stops) { ['DIA', 'McDonalds','Pivotal Labs'] }
      it "should be 150$" do
        expect(subject.quoted_cost).to eq(150)
      end
    end

    context "with five stops" do
      let(:quoted_stops) { ['DIA', 'McDonalds', 'Patagonia', 'Movement', 'Pivotal Labs'] }
      it "should be 200$" do
        expect(subject.quoted_cost).to eq(200)
      end
    end
  end
end

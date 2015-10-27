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

    context "for 2-3 stops" do
      let(:quoted_stops) { ['DIA', 'Pivotal Labs'] }
      it 'the rate should be $50 per stop' do
        expect(subject.rate).to eq(50)
      end
      context 'for 2 stops' do
        it "should be 100$" do
          expect(subject.quoted_cost).to eq(100)
        end
      end
    end


    context 'for 4-5 stops' do
      let(:quoted_stops) { ['DIA', 'McDonalds', 'Patagonia', 'Pivotal Labs'] }
      it 'the rate should be $70 per stop' do
        expect(subject.rate).to eq(70)
      end
      context 'for 4 stops' do
        it 'should be 280$' do
          expect(subject.quoted_cost).to eq(280)
        end
      end
    end

    context 'for 6 or more stops' do
      let(:quoted_stops) { ['DIA', 'McDonalds', 'Patagonia', 'Movement', 'Zeal', 'Pivotal Labs'] }
      it 'the rate should be $100 per stop' do
        expect(subject.rate).to eq(100)
      end
      context 'for 6 stops' do
        it 'should be 600$' do
          expect(subject.quoted_cost).to eq(600)
        end
      end
    end
  end
end

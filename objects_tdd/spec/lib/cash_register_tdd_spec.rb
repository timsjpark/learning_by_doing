require './lib/cash_register_tdd'

describe CashRegister do
  subject { CashRegister.new }

  describe '#total' do
    it 'should print a starting total of $0.00' do
      expect(subject.total).to eq('$0.00')
    end

    it 'should print the correct total after a payment or purchase' do
      subject.purchase(4.12)
      expect(subject.total).to eq('$4.12')
      subject.pay(3)
      expect(subject.total).to eq('$1.12')
    end
  end

  describe '#purchase' do
    it 'should add a specified amount to the total' do
      expect(subject.purchase(4.12)).to eq(4.12)
    end

    it 'should modify the total to reflect the purchase' do
      subject.purchase(4.12)
      expect(subject.total).to eq('$4.12')
    end
  end

  describe '#pay' do
    context 'should subtract a specified amount from the total and' do
      it 'should return a string if there is payment left to be made' do
        subject.purchase(2.18)
        expect(subject.pay(1.17)).to eq('You still owe $1.01')
      end

      it 'should return a string if the total has been fully paid' do
        subject.purchase(2.18)
        expect(subject.pay(3)).to eq('Your change is $0.82')
      end
    end

    it 'should modify the total to reflect the payment' do
      subject.purchase(1.23)
      subject.pay(1.23)
      expect(subject.total).to eq('$0.00')
    end
  end
end

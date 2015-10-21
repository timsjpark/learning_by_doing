require './lib/cash_register_tdd'

describe CashRegister do
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

  describe '#purchase(amount)' do
    it 'should add a specified amount to the total' do
      subject.purchase(4.12)
      expect(subject.total).to eq('$4.12')
    end
  end

  describe '#pay(amount)' do
    context 'when the payment is less than the total owed' do
      it 'should subtract a specified amount from the total' do
        subject.purchase(2.18)
        subject.pay(2)
        expect(subject.total).to eq('$0.18')
      end
      it 'should return a string that shows the remaining total' do
        subject.purchase(2.18)
        expect(subject.pay(2)).to eq('You still owe $0.18.')
      end
    end

    context 'when the payment is equal to the total owed' do
      it 'should reset the total to zero' do
        subject.purchase(2.18)
        subject.pay(2.18)
        expect(subject.total).to eq('$0.00')
      end
      it 'should return a string that thanks you for paying the exact total' do
        subject.purchase(2.18)
        expect(subject.pay(2.18)).to eq('Thank you for paying the exact amount. There is no change.')
      end
    end

    context 'when the payment is greater than the total owed' do
      it 'should reset the total to zero' do
        subject.purchase(2.18)
        subject.pay(3)
        expect(subject.total).to eq('$0.00')
      end
      it 'should return a string that shows your change' do
        subject.purchase(2.18)
        expect(subject.pay(3)).to eq('Your change is $0.82.')
      end
    end

    # context 'should subtract a specified amount from the total and' do
    #   it 'should return a string if there is payment left to be made' do
    #     subject.purchase(2.18)
    #     expect(subject.pay(1.17)).to eq('You still owe $1.01')
    #     expect(subject.total).to eq('$1.01')
    #   end
    #
    #   it 'should return a string if the total has been fully paid' do
    #     subject.purchase(2.18)
    #     expect(subject.pay(3)).to eq('Your change is $0.82')
    #     expect(subject.total).to eq('$0.00')
    #   end
    # end
    #
    # it 'should modify the total to reflect the payment' do
    #   subject.purchase(1.23)
    #   subject.pay(1.23)
    #   expect(subject.total).to eq('$0.00')
    # end
  end
end

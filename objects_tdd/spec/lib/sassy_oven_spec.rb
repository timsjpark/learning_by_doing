require './lib/sassy_oven'

describe SassyOven do
  it 'should be an oven' do
    expect(subject).to be_a(SassyOven)
  end

  ## Print the temperature

  describe '#temp' do
    it 'should print out the temperature' do
      expect(subject.temp).to eq('Temperature: 80 °F')
    end
  end

  ## Turn the oven off

  describe '#off' do
    it 'should turn the oven off' do
      expect(subject.off).to eq('Your oven is now off.')
      expect(subject.temp).to eq('Temperature: 80 °F')
    end
  end

  ## Open the damn thing

  describe '#open' do
    context 'if door is closed' do
      it 'should open the door' do
        subject.open
        expect(subject.door).to eq('open')
      end
    end

    context 'if the door is already open' do
      it 'tell you the door is already open' do
        subject.open
        expect(subject.open).to eq('Are you blind? The door is already open!')
      end
    end
  end

  ## Close the damn thing

  describe '#close' do
    context 'if the door is open' do
      it 'should close the door' do
        subject.close
        expect(subject.door).to eq('closed')
      end
    end

    context 'if the door is already closed' do
      it 'tell you the door is already closed' do
        subject.close
        expect(subject.close).to eq(
          'Are you blind? The door is already closed!'
        )
      end
    end
  end

  ## Preheat the oven

  describe '#preheat(temp)' do
    context 'if you select a temperature less than or equal to 80 F' do
      it 'should not allow you to set a temperature lower than 80 F' do
        expect(subject.preheat(70)).to eq(
          "This oven ain't a fridge! Pick a temperature above 80 °F."
        )
      end
    end
    # rubocop:disable Metrics/LineLength
    context 'if you select a temperature greater than the current oven temperature' do
      # rubocop:enable Metrics/LineLength
      it 'should warm up the oven to desired temperature' do
        expect(subject.preheat(350)).to eq(
          'Your oven is now holding at 350 °F.'
        )
      end
    end
    # rubocop:disable Metrics/LineLength
    context 'if you select a temperature less than the current oven temperature' do
      # rubocop:enable Metrics/LineLength
      it 'should cool down the oven to the desired temperature' do
        subject.preheat(350)
        expect(subject.preheat(300)).to eq(
          'Your oven is now holding at 300 °F.'
        )
      end
    end
    context 'if you select the current oven temperature' do
      it 'should tell you that it is already pre-heated' do
        subject.preheat(350)
        expect(subject.preheat(350)).to eq(
          'Your oven is already holding at 350 °F.'
        )
      end
    end
  end

  ## Bake some tasty treats

  describe '#bake(timer)' do
    context "if the oven isn't preheated" do
      it 'should remind you to preheat the oven' do
        expect(subject.bake(10)).to eq(
          'Preheat the oven before trying to bake.'
        )
        expect(subject.bake(0)).to eq(
          'Preheat the oven before trying to bake.'
        )
      end
    end

    context 'if the oven is preheated and you set a timer' do
      # let(:preheat) { subject.preheat(200) }

      before(:each) do
        subject.preheat(200)
      end

      it 'should be preheated' do
        expect(subject.temp).to eq('Temperature: 200 °F')
      end
      it 'should alert you when the timer goes off' do
        expect(subject.bake(60)).to eq('Your food is ready!')
      end
    end

    context "if the oven is preheated and you don't set a timer" do
      # Research how to replace the before block with a let

      before(:each) do
        subject.preheat(200)
      end

      it 'should warn you that you might burn your food' do
        expect(subject.bake(0)).to eq("Hope you don't burn your food!")
      end
    end
  end

  ## BROIL ALL THE THINGS!!!

  describe '#broil(timer)' do
    it 'should automatically preheat your oven to 500 F' do
      subject.broil(0)
      expect(subject.temp).to eq('Temperature: 500 °F')
    end
  end

  context 'if you set a timer' do
    it 'should alert you when the timer goes off' do
      expect(subject.broil(10)).to eq('Your food is ready!')
    end
  end

  context "if you don't set a timer" do
    it 'should warn you that you might burn your food' do
      expect(subject.broil(0)).to eq("Hope you don't burn your food!")
    end
  end
end

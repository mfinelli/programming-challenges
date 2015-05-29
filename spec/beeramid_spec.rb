require 'beeramid'

describe Beeramid do

  describe '#initialize' do
    context 'with no parameters' do
      b = Beeramid.new

      it 'should return five for price' do
        expect(b.price).to eql(5.0)
      end

      it 'should return fifty for amount' do
        expect(b.amount).to eql(50.0)
      end
    end

    context 'with integer options' do
      b=Beeramid.new(amount: 10, price: 2)

      it 'should return float for price' do
        expect(b.price).to eql(2.0)
      end

      it 'should return float for amount' do
        expect(b.amount).to eql(10.0)
      end
    end
  end

  describe '#buy_beer' do
    context 'with $20 at $5/can' do
      b = Beeramid.new(amount: 20)

      it 'should buy four cans' do
        expect(b.buy_beer).to eql(4)
      end
    end

    context 'with $13 at $5/can' do
      b = Beeramid.new(amount: 13)

      it 'should buy two cans' do
        expect(b.buy_beer).to eql(2)
      end
    end

    context 'with $12.75 at $1/can' do
      b = Beeramid.new(amount: 12.75, price: 1)

      it 'should buy 12 cans' do
        expect(b.buy_beer).to eql(12)
      end
    end

    context 'with $60 at $5.62/can' do
      b = Beeramid.new(amount: 60, price: 5.63)

      it 'should buy 10 cans' do
        expect(b.buy_beer).to eql(10)
      end
    end
  end

  describe '#calculate' do
    context 'with negative amount' do
      b = Beeramid.new(amount: -1)

      it 'returns zero' do
        expect(b.calculate).to eql(0)
      end
    end

    context 'with zero amount' do
      b = Beeramid.new(amount: 0)

      it 'returns zero' do
        expect(b.calculate).to eql(0)
      end
    end

    context 'with negative price' do
      b = Beeramid.new(price: -1)

      it 'returns nil' do
        expect(b.calculate).to be_nil
      end
    end

    context 'with zero price' do
      b = Beeramid.new(price: 0)

      it 'returns nil' do
        expect(b.calculate).to be_nil
      end
    end

    context 'with amount less than price' do
      b = Beeramid.new(amount: 1, price: 5)

      it 'returns zero' do
        expect(b.calculate).to eql(0)
      end
    end

    context 'with one can' do
      b = Beeramid.new(amount: 5)

      it 'should make one level' do
        expect(b.calculate).to eql(1)
      end
    end

    context 'with three cans' do
      b = Beeramid.new(amount: 15)

      it 'should make two levels' do
        expect(b.calculate).to eql(2)
      end
    end

    context 'with six cans' do
      b = Beeramid.new(amount: 30)

      it 'should make three levels' do
        expect(b.calculate).to eql(3)
      end
    end

    context 'with ten cans' do
      b = Beeramid.new

      it 'should make four levels' do
        expect(b.calculate).to eql(4)
      end
    end

    context 'with seven cans' do
      b = Beeramid.new(amount: 35)

      it 'should make three levels' do
        expect(b.calculate).to eql(3)
      end
    end

    context 'with eight cans' do
      b = Beeramid.new(amount: 40)

      it 'should make three levels' do
        expect(b.calculate).to eql(3)
      end
    end

    context 'with one hundred cans' do
      b = Beeramid.new(price: 1, amount: 100)

      it 'should make thirteen levels' do
        expect(b.calculate).to eql(13)
      end
    end
  end

end

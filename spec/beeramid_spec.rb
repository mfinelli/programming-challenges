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
      it 'returns zero' do
        expect(Beeramid.calculate(-1)).to eql(0)
      end
    end

    context 'with zero amount' do
      it 'returns zero' do
        expect(Beeramid.calculate(0)).to eql(0)
      end
    end

    context 'with negative price' do
      it 'returns nil' do
        expect(Beeramid.calculate(1, -1)).to be_nil
      end
    end

    context 'with zero price' do
      it 'returns nil' do
        expect(Beeramid.calculate(1, 0)).to be_nil
      end
    end

    context 'with amount less than price' do
      it 'returns zero' do
        expect(Beeramid.calculate(1, 5)).to eql(0)
      end
    end

  end
end

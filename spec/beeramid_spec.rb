require 'beeramid'

describe Beeramid do
  describe '.calculate' do

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

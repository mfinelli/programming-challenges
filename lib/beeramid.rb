class Beeramid

  attr_reader :price, :amount

  def initialize(params={})
    @price = params.fetch(:price, 5.0).to_f
    @amount = params.fetch(:amount, 50.0).to_f
  end

  def buy_beer
    (amount/price).to_i
  end

  def self.calculate(amount, price=5)
    if price <= 0
      return nil
    end

    if amount <= 0 or amount < price
      return 0
    end
  end

end

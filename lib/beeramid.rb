class Beeramid

  attr_reader :price, :amount

  def initialize(params={})
    @price = params.fetch(:price, 5.0).to_f
    @amount = params.fetch(:amount, 50.0).to_f
  end

  def buy_beer
    (amount/price).to_i
  end

  def calculate
    if price <= 0
      return nil
    end

    if amount <= 0 or amount < price
      return 0
    end

    cans_remaining = buy_beer
    levels = 0

    while cans_remaining > 0
      if cans_remaining < levels + 1
        return levels
      else
        levels += 1
        cans_remaining -= levels
      end
    end
  end

end

class Beeramid

  def self.calculate(amount, price=5)
    if price <= 0
      return nil
    end

    if amount <= 0 or amount < price
      return 0
    end
  end

end

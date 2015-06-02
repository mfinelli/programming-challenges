# Create a pyramid of beer cans!
#
# @author Mario Finelli
class Beeramid

  # @return [Float] How much money we have to spend on beer
  attr_reader :amount

  # @return [Float] The price of one beer
  attr_reader :price

  # Returns a new instance of Beeramid.
  #
  # @param [Hash] params The options to create the beeramid
  # @option params [Fixnum, Float] :price The price of a beer
  # @option params [Fixnum, Float] :amount How much money we have to spend
  #
  # @return [Beeramid] New instance of Beeramid
  def initialize(params={})
    @price = params.fetch(:price, 5.0).to_f
    @amount = params.fetch(:amount, 50.0).to_f
  end

  # Returns the number of beers you can buy with the amount of money you have
  # and the price per beer.
  #
  # @return [Fixnum] Number of beers that can be bought
  def buy_beer
    (amount/price).to_i
  end

  # Calculate the number of levels of the pyramid that can be made with the
  # amount of beer that you can buy.
  #
  # @return [Fixnum] Number of levels of the pyramid that can be made
  def calculate
    if price <= 0
      return nil
    end

    # We should return no levels if we don't have any money or not enough
    # money to buy any beer!
    if amount <= 0 or amount < price
      return 0
    end

    # Calculate how much beer we can buy and initialize the number of levels
    # to zero.
    cans_remaining = buy_beer
    levels = 0

    # Each n level requires n beers, so while we have beers left and they are
    # more than the next level's cost (n + 1) then we can add a level.
    # Otherwise we have reached the maximum number of levels.
    while cans_remaining > 0
      if cans_remaining < levels + 1
        return levels
      else
        levels += 1
        cans_remaining -= levels
      end
    end

    # If we use all of the cans then the loop breaks, return the number of
    # levels.
    levels
  end

end

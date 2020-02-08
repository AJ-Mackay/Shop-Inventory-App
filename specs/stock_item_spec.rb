require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/stock_item')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class StockItemTest < Minitest::Test

  def setup()
    @stock_item = StockItem.new("quantity" => 13)
  end

  def test_item_has_quantity
    assert_equal(13, @stock_item.quantity)
  end

end

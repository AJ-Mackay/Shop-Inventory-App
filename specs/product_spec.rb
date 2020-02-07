require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/product')
require_relative('../models/stock_item')
require_relative('../models/supplier')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ProductTest < Minitest::Test

def setup()
  @product = Product.new("Drawing Blood", "Poppy Z. Brite", "Horror", "desc. goes here", supplier_id, stock_item_id, 7, 12)

end

end

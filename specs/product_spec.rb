require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/product')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ProductTest < Minitest::Test

  def setup()
    @product = Product.new({"book_name" => "Drawing Blood", "author" => "Poppy Z. Brite", "genre" => "Horror", "description" => "desc. goes here", "supplier_id" => 1, "quantity" => 5, "wholesale_price" => 7, "retail_price" => 12})
  end

  def test_product_has_title
    assert_equal("Drawing Blood", @product.book_name)
  end

  def test_product_has_author
    assert_equal("Poppy Z. Brite", @product.author)
  end

  def test_product_has_genre
    assert_equal("Horror", @product.genre)
  end

  def test_product_has_description
    assert_equal("desc. goes here", @product.description)
  end

  def test_product_has_supplier
    assert_equal(1, @product.supplier_id)
  end

  def test_product_has_quantity
    assert_equal(5, @product.quantity)
  end

  def test_product_wholesale
    assert_equal(7, @product.wholesale_price)
  end

  def test_product_retail
    assert_equal(12, @product.retail_price)
  end

end

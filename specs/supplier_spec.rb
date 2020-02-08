require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/supplier')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SupplierTest < Minitest::Test

  def setup()
    @supplier = Supplier.new({"name" => "World of Books", "email" => "customerservice@worldofbooks.com", "contact_number" => "+44 (0)1903 507 544", "website" => "http://worldofbooks.com"})
  end

  def test_supplier_has_name
    assert_equal("World of Books", @supplier.name)
  end

  def test_supplier_has_email
    assert_equal("customerservice@worldofbooks.com", @supplier.email)
  end

  def test_supplier_has_contact_number
    assert_equal("+44 (0)1903 507 544", @supplier.contact_number)
  end

  def test_supplier_website
    assert_equal("http://worldofbooks.com", @supplier.website)
  end

end

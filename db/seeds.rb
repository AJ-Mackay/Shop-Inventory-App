require_relative("../models/supplier.rb")
require_relative("../models/product.rb")
require("pry-byebug")

Product.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({
  "name" => "Barter Books", "email" => "bb@barterbooks.co.uk", "contact_number" => "+44 (0)1665 604 888", "website" => "http://www.barterbooks.co.uk"
  })
supplier1.save()

supplier2 = Supplier.new({
  "name" => "Wordery", "email" => "help@wordery.com", "contact_number" => "N/A", "website" => "http://wordery.com"
  })
supplier2.save()

supplier3 = Supplier.new({
  "name" => "World of Books", "email" => "customerservice@worldofbooks.com", "contact_number" => "+44 (0)1903 507 544", "website" => "http://worldofbooks.com"
  })
supplier3.save()

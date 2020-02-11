require_relative("../models/supplier.rb")
require_relative("../models/product.rb")
require("pry-byebug")

Product.delete_all()
Supplier.delete_all()

supplier1 = Supplier.new({"picture" => "/images/Barter.png", "name" => "Barter Books", "email" => "bb@barterbooks.co.uk", "contact_number" => "+44 (0)1665 604 888", "website" => "http://www.barterbooks.co.uk"})
supplier1.save()

supplier2 = Supplier.new({"picture" => "/images/World.png", "name" => "World of Books", "email" => "customerservice@worldofbooks.com", "contact_number" => "+44 (0)1903 507 544", "website" => "http://worldofbooks.com"})
supplier2.save()

product1 = Product.new({"picture" => "/images/Drawing_Blood.jpg", "book_name" => "Drawing Blood", "author" => "Poppy Z. Brite", "genre" => "Horror", "description" => "Penguin, 2010, Paperback", "supplier_id" => supplier2.id, "quantity" => 17, "wholesale_price" => 7, "retail_price" => 12})
product1.save()

product2 = Product.new({"picture" => "/images/Mindset.jpg", "book_name" => "Mindset", "author" => "Dr Carol S. Dweck", "genre" => "Popular Psychology", "description" => "Robinson, 2017, Paperback", "supplier_id" => supplier2.id, "quantity" => 3, "wholesale_price" => 4, "retail_price" => 11})
product2.save()

product3 = Product.new({"picture" => "/images/Alice.jpg", "book_name" => "Alice Isn't Dead", "author" => "Joseph Fink", "genre" => "Science Fiction", "description" => "Harper Perennial, 2018, Hardcover", "supplier_id" => supplier1.id, "quantity" => 0, "wholesale_price" => 10, "retail_price" => 15})
product3.save()

product4 = Product.new({"picture" => "/images/HoL.jpg", "book_name" => "House of Leaves", "author" => "Mark Z. Danielewski", "genre" => "Thriller", "description" => "Doubleday, 2000, Paperback", "supplier_id" => supplier1.id, "quantity" => 10, "wholesale_price" => 20, "retail_price" => 28})
product4.save()

product5 = Product.new({"picture" => "/images/Kidding.jpg", "book_name" => "Seriously...I'm Kidding", "author" => "Ellen DeGeneres", "genre" => "Autobiography", "description" => "Grand Central Publishing, 2013, Paperback", "supplier_id" => supplier2.id, "quantity" => 7, "wholesale_price" => 8, "retail_price" => 13})
product5.save()

binding.pry
nil

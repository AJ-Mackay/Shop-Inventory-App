require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/products_controller')
require_relative('controllers/suppliers_controller')
require_relative('./models/product')
require_relative('./models/supplier')
also_reload('./models/*')

get '/' do
  redirect to '/products'
end

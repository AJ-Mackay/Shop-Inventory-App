require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product')
require_relative('../models/supplier')
also_reload('../models/*')

get '/products' do
  @products = Product.all()
  erb(:"products/index")
end

get '/products/new' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:"products/new")
end

get '/products/:id' do
  @product = Product.find(params[:id])
  erb(:"products/show")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  erb(:"products/create")
end

get '/products/:id/edit' do
  @product = Product.find(params[:id])
  @suppliers = Supplier.all()
  erb(:"products/edit")
end

post '/products/:id' do
  Product.new(params).update
  redirect to '/products'
end

post '/products/:id/delete' do
  Product.delete(params[:id].to_i)
  redirect to '/products'
end

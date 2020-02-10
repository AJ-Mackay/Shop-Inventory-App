require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product')
require_relative('../models/supplier')
also_reload('../models/*')

get '/suppliers' do
  @supplier = Supplier.all()
  erb(:"suppliers/index")
end

get '/suppliers/new' do
  @products = Product.all()
  erb(:"suppliers/new")
end

get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb(:"suppliers/show")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @supplier.save()
  erb(:"suppliers/create")
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb(:"suppliers/edit")
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect to '/suppliers'
end

post '/suppliers/:id/delete' do
  Supplier.delete(params[:id].to_i)
  redirect to '/suppliers'
end

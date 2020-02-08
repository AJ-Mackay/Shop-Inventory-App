require_relative('../db/sql_runner')

class Supplier

  attr_reader :id, :name, :email,  :contact_number, :website

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @email = options['email']
    @contact_number = options['contact_number']
    @website = options['website']
  end

  def save()
    sql = "INSERT INTO suppliers (name, email, contact_number, website) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @email, @contact_number, @website]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def stock_items()
    sql = "SELECT * FROM stock_items INNER JOIN products ON products.stock_item_id = stock_item.id WHERE products.supplier_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|stock_item| StockItem.new(stock_item)}
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run(sql)
    return results.map{|supplier| Supplier.new(supplier)}
  end

  def self.find(id)
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end

end

require_relative('../db/sql_runner')

class StockItem

  attr_reader :id, :quantity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @quantity = options['quantity']
  end

  def save()
    sql = "INSERT INTO stock_items (quantity) VALUES ($1) RETURNING id"
    values = [@quantity]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def suppliers()
    sql = "SELECT * FROM suppliers INNER JOIN products ON products.supplier_id = supplier.id WHERE products.stock_item_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|supplier| Supplier.new(supplier)}
  end

  def self.all()
    sql = "SELECT * FROM stock_items"
    results = SqlRunner.run(sql)
    return results.map{|stock| StockItem.new(stock)}
  end

  def self.find(id)
    sql = "SELECT * FROM stock_items WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return StockItem.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM stock_items WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stock_items"
    SqlRunner.run(sql)
  end

end

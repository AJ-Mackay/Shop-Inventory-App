require_relative('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :picture, :name, :email, :contact_number, :website

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @picture = options['picture']
    @name = options['name']
    @email = options['email']
    @contact_number = options['contact_number']
    @website = options['website']
  end

  def save()
    sql = "INSERT INTO suppliers (picture, name, email, contact_number, website) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@picture, @name, @email, @contact_number, @website]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers SET (picture, name, email, contact_number, website) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@picture, @name, @email, @contact_number, @website, @id]
    SqlRunner.run(sql, values)
  end

  def product()
    sql = "SELECT * FROM products WHERE id = $1"
    values = [@product_id]
    results = SqlRunner.run(sql, values)
    return Supplier.new(results.first)
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

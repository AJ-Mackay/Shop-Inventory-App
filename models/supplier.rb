require_relative('../db/sql_runner')

class Supplier

  attr_reader :id, :name, :contact_details

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_details = options['contact_details']
  end

  def save()
    sql = "INSERT INTO suppliers (name, contact_details) VALUES ($1, $2) RETURNING id"
    values = [@name, @contact_details]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    results = SqlRunner.run(sql)
    return results.map{|supplier| Supplier.new(supplier)}
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

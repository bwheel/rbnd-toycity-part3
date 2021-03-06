class Transaction
  
  @@id = 0
  @@transactions = []
  
  attr_reader :customer, :product, :id
  
  def initialize(customer, product)
  
    product.purchase
    
    #update the class attributes
    @@id += 1
    
    # Update the instance attributes
    @id = @@id
    @customer = customer
    @product = product
    
    @@transactions << self
  end
  
  def self.all
    @@transactions
  end
  
  def self.find(search_id)
    @@transactions.select {|trans| trans.id == search_id }[0]
  end
  
end

class ReturnTransaction < Transaction
  
  def initialize(customer, product)

    product.return

    #update the class attributes
    @@id += 1

    # Update the instance attributes
    @id = @@id
    @customer = customer
    @product = product

    @@transactions << self
  end
end
class Transaction
    
    @@id = 0
    @@transactions = []
    
    attr_reader :customer, :product, :id
    
    def initialize(customer, product)
        
        #update the class attributes
        @@id += 1
        
        # Update the instance attributes
        @id = @@id
        @customer = customer
        @product = product
        
        @product.stock -= 1
        
        @@transactions << self
    end
    
    
    
end
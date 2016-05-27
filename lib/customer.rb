class Customer
    
    attr_reader :name
    
    @@Customers = []
    
    def initialize(options = {})
        if @@Customers.any? {|customer| customer.name == options[:name]}
            throw :DuplicateCustomerError
        end
        
        @name = options[:name]
        
        @@Customers << self
        
    end
    
    def self.all
        @@Customers
    end
end
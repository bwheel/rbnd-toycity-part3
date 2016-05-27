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
    
    def self.find_by_name(search_name)
        @@Customers.select {|customer| customer.name == search_name }[0]
    end

end
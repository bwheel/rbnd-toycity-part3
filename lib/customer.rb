class Customer
    
    attr_reader :name
    
    @@Customers = []
    
    def initialize(options = {})
        
        # check for duplicates
        check_for_duplicates(options)
        
        # assign the customer attribute.
        @name = options[:name]
        
        #keep track of the new customer instance.
        @@Customers << self
        
    end
    
    def purchase(product)
        Transaction.new(self, product)
    end
    
    def return_purchase(product)
        ReturnTransaction.new(self, product)
    end
    
    def self.all
        @@Customers
    end
    
    def self.find_by_name(search_name)
        @@Customers.select {|customer| customer.name == search_name }[0]
    end

    private 
    
    def check_for_duplicates(options = {})
        if @@Customers.any? {|customer| customer.name == options[:name]}
            throw :DuplicateCustomerError
        end
    end
    
    
        
end
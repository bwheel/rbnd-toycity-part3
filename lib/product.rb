class Product
    
    attr_accessor :title, :price, :stock
    
    @@products = []
    
    def initialize(options = {})
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        
        @@products << self
    end
    
    def self.all
        @@products    
    end
    
    
end
    
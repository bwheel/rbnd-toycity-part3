class Product
    
    attr_accessor :title, :price, :stock
    
    @@products = []
    
    def initialize(options = {})
        
        if @@products.any? { |prod| prod.title == options[:title] } 
            throw :DuplicateProductError
        end
        
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        
        @@products << self
    end
    
    def in_stock?
        @stock > 0
    end
    
    def self.all
        @@products    
    end
    
    def self.find_by_title(search_title)
       @@products.select { |prod| prod.title == search_title}[0]
    end
    
    def self.in_stock
       @@products.select { |prod| prod.stock > 0 }
    end
    
end
    
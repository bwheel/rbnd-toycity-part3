class Product
    
    attr_accessor :title, :price, :stock, :brand
    
    @@products = []
    
    def initialize(options = {})
        
        # check for duplicates
        check_for_duplicates(options)
        
        #assign the instance variables with data.
        assign_attributes(options)
        
        # keep track of this instance in the class list.
        @@products << self
    end
    
    def in_stock?
        @stock > 0
    end
    
    def return
        @stock += 1
    end
    
    def purchase
        if in_stock?
            @stock -= 1
        else
            throw :OutOfStockError
        end
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
    
    private
    
    def check_for_duplicates(options = {})
        if @@products.any? { |prod| prod.title == options[:title] } 
            throw :DuplicateProductError
        end
    end
    
    def assign_attributes(options = {})    
        @title = options[:title]
        @price = options[:price]
        @stock = options[:stock]
        @brand = if options[:brand] == nil then "0" else options[:brands] end
    end
    
end
    
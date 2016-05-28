class Brand
   
  @@brands = []
   
  attr_reader :name
   
  def initialize(options = {})
    
    @name = options[:name]
    
    @@brans << self
  end
   
  def self.all
    @@brands
  end

  def self.find_by_name(search_name)
    @@brands.select {|brand| brand.name == search_name }
  end

  def check_for_duplicates(options = {})
    if @@brands.any? { |brand| brand.name == options[:name] }
      raise :DuplicateBrandError, "#{self.name} brand already exists"
    end
  end
end
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Product
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

  attr_reader :id
  attr_accessor :name, :general_info, :technical_specs, :where_to_buy

  # Creates a new Product Object
  #
  # options - empty Hash
  #   id (optional) - Integer, primary key
  #   name (optional) - String, name of Product
  #   general_info (optional) - String, information about Product
  #   technical_specs (optional) - String, technical information about Product
  #   where_to_buy (optional) - String, location of where to buy Product
  #
  # Returns a Product Object
  def initialize(options = {})
    @id = options["id"]
    @name = options["name"]
    @general_info = options["general_info"]
    @technical_specs = options["technical_specs"]
    @where_to_buy = options["where_to_buy"]
  end

  # Adds a new Object to the database if it has valid fields
  #
  # Returns the Object if it was added to the database or false if it failed
  def add_to_database
    if self.valid?
      Product.add({"name" => "#{self.name}", "general_info" => "#{self.general_info}", "technical_specs" => "#{self.technical_specs}", "where_to_buy" => "#{self.where_to_buy}"})
    else
      false
    end
  end

  # Ensures that an updated Product Object has valid fields before saving
  #
  # Returns the Object if saved or false if save failed
  def save_valid
    if self.valid_save?
      self.save
    else
      false
    end
  end

  # Utility - Checks if the fields for a new Object are entered correctly
  #
  # Returns valid - true/false Boolean
  def valid?
    valid = true

    if self.name.nil? || self.name == ""
      valid = false
    end

    if self.general_info.nil? || self.general_info == ""
      valid = false
    end

    if self.technical_specs.nil? || self.technical_specs == ""
      valid = false
    end

    if self.where_to_buy.nil? || self.where_to_buy == ""
      valid = false
    end

    product_to_find = DATABASE.execute("SELECT name FROM products;")

    product_to_find.each do |names|
      if names["name"] == @name
        valid = false
      end
    end

    return valid
  end

  # Utility - Checks if the fields for a saved Object are entered correctly
  #
  # Returns valid - true/false Boolean
  def valid_save?
    valid = true

    if self.name.nil? || self.name == ""
      valid = false
    end

    if self.general_info.nil? || self.general_info == ""
      valid = false
    end

    if self.technical_specs.nil? || self.technical_specs == ""
      valid = false
    end

    if self.where_to_buy.nil? || self.where_to_buy == ""
      valid = false
    end

    return valid
  end

end

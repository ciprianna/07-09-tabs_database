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

end

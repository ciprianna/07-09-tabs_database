require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Product
  extend DatabaseClassMethods
  include DatabaseInstanceMethods

end

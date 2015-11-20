require 'ostruct'
# ostruct for that lazy goodness
class StudentSearch < OpenStruct
  # Get activemodel in there for all its cool functionality like model name, pluralization, validation, yada yada yada
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming
 
 
  # you can do cool things here, just make sure you call super so ostruct 
  # takes all those hash params and makes them methods
  def initialize(*args)
    super
  end
 
  # ActiveModel needs to know that this wasn't persisted.
  def persisted? ; false ; end;
end
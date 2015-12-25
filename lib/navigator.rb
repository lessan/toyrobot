require 'type_checker'

class Navigator
  attr_reader :object

  def initialize(object)
    @object = object
  end
end

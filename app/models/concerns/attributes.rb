module Attributes

  def get_attributes attr, options = {}
    options.reverse_merge! except: []
    as_json.except(*options.delete(:except)).method(attr).call
  end

end

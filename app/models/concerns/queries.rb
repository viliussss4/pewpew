module Queries
  extend ActiveSupport::Concern

  def find! id
    object = self.find { |object| id == object.id }
    unless object
      raise Pewpew::Errors::DataNotFound
    end
    object
  end

end

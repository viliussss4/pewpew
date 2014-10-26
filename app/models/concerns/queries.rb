module Queries
  extend ActiveSupport::Concern

  def find! id
    object = self.find { |object| id.to_i == object.id }
    unless object
      raise Pewpew::Errors::DataNotFound
    end
    object
  end

  def order_by! field, order = :asc
    ordered = self.sort_by!(&field.to_sym)
    ordered.reverse! if :desc == order
    ordered
  end

end

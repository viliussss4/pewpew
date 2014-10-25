class Outcome
  include Virtus.model

  attribute :id, Integer
  attribute :description, String
  attribute :price_decimal, Float
  attribute :price, String
  attribute :price_id, Integer
  attribute :print_order, Integer
  attribute :opponent_id, Integer
  attribute :deduction, Integer
  attribute :sp, Boolean
  attribute :nr, Boolean
  attribute :market, String
end

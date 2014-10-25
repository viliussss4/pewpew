class Event < Pewpew::Data
  include Virtus.model

  attribute :id, Integer
  attribute :is_virtual, Boolean
  attribute :event_id, Integer
  attribute :title, String
  attribute :market_id, Integer
  attribute :market_type_id, Integer
  attribute :status_id, Integer
  attribute :score, String
  attribute :description, String
  attribute :start_time, Integer
  attribute :meeting, String
  attribute :media, String
  attribute :american_format, Boolean
  attribute :event_type, String
  attribute :pos, Integer
  attribute :home_team, String
  attribute :away_team, String
  attribute :team_information, String
  attribute :home_score, Integer
  attribute :away_scoew, Integer
  attribute :period_id, Integer
  attribute :status_type, String
  attribute :status, String
  attribute :total_outcomes, Integer
  attribute :outcomes, Array
end

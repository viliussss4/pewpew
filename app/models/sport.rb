class Sport < Pewpew::Data
  include Virtus.model

  attribute :id, Integer
  attribute :title, String
  attribute :meetings, Array
  attribute :is_virtual, Boolean
  attribute :events, Array

  class << self

    def all!
      if data.instance_of? Array
        data.map { |d| new d }
      else
        raise Pewpew::Errors::Api.new 'try to sync data first'
      end
    end

    def find! id
      sport = all!.find { |sport| id == sport.id }
      unless sport
        raise Pewpew::Errors::DataNotFound
      end
      sport
    end

  end

end

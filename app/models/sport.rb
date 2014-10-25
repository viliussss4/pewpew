class Sport < Pewpew::Data
  include Virtus.model

  attribute :id, Integer
  attribute :title, String
  attribute :meetings, Array
  attribute :is_virtual, Boolean
  attribute :events, Array[Event]

  class << self

    def all!
      if data.instance_of? Array
        data.map { |d| new d }
      else
        raise Pewpew::Errors::Api.new 'try to sync data first'
      end
    end

    def find! id
      all!.extend(Queries).find! id
    end

  end

  def events
    super.extend Queries
  end

end

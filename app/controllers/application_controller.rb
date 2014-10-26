class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Pewpew::Errors::DataNotFound, with: :render_404
  rescue_from Pewpew::Errors::Api, with: :cannot_connect_to_remote
  before_action :fetch_data, if: -> { Pewpew::Data.data.nil? }

  private

  def fetch_data
    Pewpew::Data.sync!
  end

  def cannot_connect_to_remote
    render file: 'shared/no_data'
  end

  def render_404
    raise ActionController::RoutingError.new 'Not Found'
  end

  def find_sport
    @sport = Sport.find! params[:sport_id]
  end

  def find_event id
    @sport.events.find! id
  end

end

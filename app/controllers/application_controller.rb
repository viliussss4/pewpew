class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from Pewpew::Errors::DataNotFound, with: :render_404

  private

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

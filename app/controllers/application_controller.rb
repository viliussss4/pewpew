class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def find_sport
    @sport = Sport.find! params[:sport_id]
  end

  def find_event id
    @sport.events.find! id
  end

end

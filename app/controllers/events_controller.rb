class EventsController < ApplicationController
  before_action :find_sport

  def index
    @events = @sport.events
  end

  def show
    @event = @sport.events.find! params[:id]
  end

  private

  def find_sport
    @sport = Sport.find! params[:sport_id]
  end

end

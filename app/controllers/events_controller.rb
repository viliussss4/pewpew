class EventsController < ApplicationController
  before_action :find_sport

  def index
    @events = @sport.events
  end

  def show
    @event = find_event params[:id]
  end

end

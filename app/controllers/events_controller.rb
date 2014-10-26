class EventsController < ApplicationController
  before_action :find_sport

  def index
    @events = @sport.events.order_by! :pos, :asc
  end

  def show
    @event = find_event params[:id]
  end

end

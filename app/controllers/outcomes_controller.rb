class OutcomesController < ApplicationController
  before_action :find_sport

  def index
    @outcomes = @sport.events.find! params[:event_id]
  end

end

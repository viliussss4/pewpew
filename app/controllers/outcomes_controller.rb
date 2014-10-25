class OutcomesController < ApplicationController
  before_action :find_sport

  def index
    @outcomes = find_event params[:event_id]
  end

end

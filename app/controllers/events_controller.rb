class EventsController < ApplicationController
  
  def index
  end
  
  def new
    @event = Event.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: {event: @event })
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
end

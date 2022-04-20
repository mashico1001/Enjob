class EventsController < ApplicationController

  before_action :baria_user, {only: [:show, :edit, :update, :destroy]}

  def index
    @events = current_user.events
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    @event.user_id = current_user.id

    if @event.save
        redirect_to action: :index
    else
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.user_id = current_user.id

    @event.update(params_event)
    redirect_to action: :index

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to action: :index
  end


  private

  def params_event
    permitted_params = params.require(:event).permit(:title, :body, :start_date, :end_date, :date).tap do |event_params|
      event_params[:start_date] = Time.zone.parse("#{event_params[:date]} #{event_params[:start_date]}")
      event_params[:end_date] = Time.zone.parse("#{event_params[:date]} #{event_params[:end_date]}")
    end
    permitted_params.delete(:date)
    permitted_params
  end

  def baria_user
    unless Event.find(params[:id]).user.id.to_i == current_user.id
      redirect_to events_path(current_user)
    end
  end


end

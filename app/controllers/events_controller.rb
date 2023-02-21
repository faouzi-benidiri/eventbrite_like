class EventsController < ApplicationController
  
  def index
    
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params).save(validate: false)
    redirect_to welcome_index_path
  end

  def edit
    @event = Event.find(params[:id])
  end
end

private

def event_params
  params.require(:event).permit(:start_date, :duration,:title, :description, :price, :location)
end
class EventsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :set_event, execpt: [:show]
  # before_action :check_admin, only: [:edit, :update, :destroy]
  # skip_before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
    if @event.save(validate: false)
      redirect_to @event
    else
      render :new
    end
    
  end

  def edit
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  
    redirect_to welcome_index_path
  end
end

private

def event_params
  params.require(:event).permit(:start_date, :duration,:title, :description, :price, :location, :image)
end

def set_event
  @event = Event.find(params[:id])
end

def check_admin
  unless current_user && current_user.id == @event.admin_id
    redirect_to event_path, alert: "You don't have permission to do that."
  end

  
def authorize_user
  unless current_user == @event.admin_id
    redirect_to event_path, alert: "You are not authorized to perform this action."
  end
end
end

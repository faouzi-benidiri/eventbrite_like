class WelcomeController < ApplicationController
  def index
    @events = Event.all
  end

  def show
   
  end

  def secret
  end
end

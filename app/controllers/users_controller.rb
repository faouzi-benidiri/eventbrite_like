class UsersController < ApplicationController
  
  
  def show
    redirect_to new_user_session_path
  end
  
  def create
    @user = User.create(user_params).save(validate: false)
    redirect_to welcome_index_path
  end
end
private

def event_params
  params.require(:user).permit(:email, :password)
end
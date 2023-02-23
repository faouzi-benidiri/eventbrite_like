class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.create(user_params).save(validate: false)
    redirect_to welcome_index_path
  end
  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end
end
private

def user_params
  params.require(:user).permit(:email, :description, :password, :first_name, :last_name, :avatar)
end
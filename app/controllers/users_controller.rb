class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      # TODO: jump straight into dog options
      redirect_to user_path(@user)
    else
      render :'users/new'
    end
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
  end

  def destroy
    set_user
    @user.destroy!
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

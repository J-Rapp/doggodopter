class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      # TODO: jump straight into dog options
      redirect_to edit_user_path(@user)
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
    update_user_attributes
    if @user.save validate: false
      redirect_to dogs_path
    else
      render :'users/edit'
    end
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
    params.require(:user).permit(:email, :password, :password_confirmation, :cats, :children, :energy)
  end

  def update_user_attributes
    @user.cats = user_params[:cats]
    @user.children = user_params[:children]
    @user.energy = user_params[:energy]
  end
end

class SessionsController < ApplicationController
  include ApplicationHelper

  def new
    @login = LoginForm.new
  end

  def create
    @login = LoginForm.new(login_form_params)
    if @login.valid?
      user_id = @login.user_id
      user_session(user_id)
      redirect_to user_path(user_id)
    else
      render :'sessions/new'
    end
  end

  def destroy
    end_user_session
    redirect_to root_path
  end

  private

  def login_form_params
    params.require(:login_form).permit(:username, :password)
  end
end

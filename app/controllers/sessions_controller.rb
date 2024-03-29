class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You logged in"
      sign_in user
      redirect_back_or root_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
      
  end

  def destroy
    flash[:success] = "You logged out"
    sign_out
    redirect_to root_path
  end  

end

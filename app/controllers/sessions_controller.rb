class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "logged in successfully"
    else
      flash.now[:notice] = "Incorrect email or password, try again!"
      render action: :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Bye bye!"
  end
end

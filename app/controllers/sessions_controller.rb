class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present?
      pass = BCrypt::Password.new(@user.password_digest)
      if pass == params[:user][:password]
        session[:user_id] = @user.id
        redirect_to root_path, notice: "logged in successfully"
      else
        redirect_to new_session_path, notice: "Email or password not works."
      end
    else 
      redirect_to new_session_path, notice: "Email or password not works."
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Bye bye!"
  end
end

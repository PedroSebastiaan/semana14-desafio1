class UsersController < ApplicationController
    # before_action :set_user, only: %i[ show edit update destroy ]

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(email: params[:user][:email])
        if @user.present? != true
            @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to root_path
        else 
            redirect_to users_sign_up_path, notice: "This email is already taken."
        end
        # respond_to do |format|
        #     if @user.save
        #         format.html { redirect_to root_path, notice: "User was successfully created." }
        #         format.json { render :show, status: :created, location: @user }
        #     else
        #         format.html { render :new, status: :unprocessable_entity }
        #         format.json { render json: @user.errors, status: :unprocessable_entity }
        #     end
        # end
    end

    def show
        
    end

    def destroy
    end

    private 

    # def set_user
    #     @user = User.find(params[:id])
    # end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
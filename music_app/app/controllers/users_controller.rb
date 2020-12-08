class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:session_token] = @user.reset_session_token!
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages
            redirect_to user_url(new) 
        end
    end

    def show
        # debugger
        redirect_to users_url(params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end

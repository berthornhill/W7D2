class UsersController < ApplicationController

    def new
        # # debugger
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        # # debugger
        if @user.save
            session[:session_token] = @user.reset_session_token!
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
        # debugger
    end

    def show
        # # debugger
        render :show
    end


    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end

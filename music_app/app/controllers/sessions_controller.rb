class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user =  User.find_by_credentials(params[:user][:email], params[:user][:password])
        debugger
        if @user 
            session[:session_token] = @user.reset_session_token!
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid credentials']
            render :new
        end
    end

    def detroy
        
    end
end

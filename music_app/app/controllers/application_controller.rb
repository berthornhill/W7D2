class ApplicationController < ActionController::Base

    def current_user
        @current_user ||= User.find_by(session_token: [:session_token])
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout
        session[:session_token] = nil
        current_user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def ensure_logged_in
        redirect_to sessions_url unless logged_in?
    end

end

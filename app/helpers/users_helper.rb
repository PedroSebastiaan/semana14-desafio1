module UsersHelper
    def current_user
        User.find(session[:user_id]) unless session[:user_id].nil?
    end

    def logged_in?
        session[:user_id].present?
    end
end
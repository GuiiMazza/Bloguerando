class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #def current_user?(user)
   # user == current_user
  #end

  #def current_user
   # if(user_id = session[:user_id])
    #  @current_user == User.find(id: user_id)
    #end
  #end
end

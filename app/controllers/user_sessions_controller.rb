class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end
  
 def create

  @user_session = UserSession.new(params[:user_session])
  
  if @user_session.save
    if current_user.id !=nil
      redirect_to user_items_url
   
    flash[:notice] = "Successfully logged in."    
    end
  else
    flash[:notice] = "Invalid email or password."
    render :action => 'new'
  end
end

def destroy
  @user_session = UserSession.find
  @user_session.destroy
  flash[:notice] = "Successfully logged out."
  redirect_to root_url
end

end
class UserSessionsController < ApplicationController
 #before_filter :require_no_user, :only => [:new, :create]
 # before_filter :require_user, :only => :destroy 
  

  def new
    @user_session = UserSession.new
    respond_to do |format|
      format.html
    end
  end
  
 def create

  @user_session = UserSession.new(params[:user_session])
  
  if @user_session.save
    if current_user.id !=nil
      redirect_to users_url  
    end
  else
    
    render :action => 'new'
  end
end

def destroy
  @user_session = UserSession.find
  @user_session.destroy
  #flash[:notice] = "Successfully logged out."
  redirect_to root_url
end

end
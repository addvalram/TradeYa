class UsersController < ApplicationController
  def index   
    @users= User.find(:all)    
    @offerCount=Offer.find(:all, :conditions => ["public_user_id = ?",current_user.id]).count
    @itemsCount=Item.find(:all, :conditions => ["user_id = ?",current_user.id]).count
    @user=User.find(current_user.id)
    respond_to do |f|
      f.html
      
    end
  end
  def create
 
  @user = User.new(params[:user])
  if @user.save
    flash[:notice] = "Registration successful."
    redirect_to users_path
  else
    render :action => 'new'
  end
end

def edit
  @user = current_user
end

def update
  @user = current_user
  if @user.update_attributes(params[:user])
    flash[:notice] = "Successfully updated profile."
    redirect_to root_url
  else
    render :action => 'edit'
  end
end

def show
  @user=User.find(params[:id])
  respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
end

end

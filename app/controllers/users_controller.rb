class UsersController < ApplicationController
  before_filter :require_user, :except => [:new ,:create]
  def index
    @users= User.find(:all)
    #@items= Item.find(:all)
    # @offerCount=Offer.find_by_sql(["select * from offers where user_id <>? and offer_respond <>?",current_user.id,"accepted"]).count
    @offerCount=Offer.find_by_sql(["select * from offers where public_user_id=? and offer_respond=?",current_user.id,"offered"]).count
    @itemsCount=Item.findItemCount(current_user)
    @user=User.find(current_user.id)
    @offers=Offer.findrecent()
    debugger
    @user_items=Item.find_by_sql(["select * from items where user_id=?",current_user.id])
    @items=Item.findpostItem(current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
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

# def validate_offer_by_status
# debugger
# temp_item_id=Offer.find_by_sql(["select item_id from offers where offer_status= ? and item_id=?",1,params[:item][:item_id]])
# temp_my_item_id=Offer.find_by_sql(["select my_item_id from offers where offer_status= ? and my_item_id=?",1,params[:item][:my_item_id]])
#
# #Offer.find_by_sql(["select id from offers where offer_status= ? and my_item_id =? and item_id=?",1,params[:item][:my_item_id],params[:item][:item_id]])
#
# if  temp_item_id[0].item_id !=  temp_my_item_id[0].my_item_id
# flash[:notice]="offer already done"
# else
# flash[:notice]="offer already done"
# end
# end
end
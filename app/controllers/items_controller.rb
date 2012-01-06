class ItemsController < ApplicationController
  before_filter :require_user
  # GET /items
  # GET /items.xml
  def index
 #@user_item = Item.paginate(:per_page=>3,:page=>params[:page])
# @comments=Comment.find_by_sql(["select * from comments where item_id=?",params[:item_id]])  
    user =User.find(current_user)
    @items = user.items.find(:all).paginate(:per_page=>3,:page=>params[:page])
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = current_user.items.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = current_user.items.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @item.user=User.find(params[:user_id])
    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to user_items_url(current_user) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update

    @item = current_user.items.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to user_item_url(@item.user,@item) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @offer_my_item_id = Offer.find_by_sql(["select * from offers where my_item_id= ?",params[:id]])
    @offer_my_item_id.each do |my_item_id|
      my_item_id.destroy
    end
    respond_to do |format|
      format.html { redirect_to users_path() }
      format.xml  { head :ok }
    end
  end
end
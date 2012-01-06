class SharesController < ApplicationController
  def index
   debugger
    item = Item.find(params[:item_id])
    @shares = item.shares.find(:all)
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shares }
    end
  end
end


  def new
    @share = Share.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @share }
    end
  end
def show
    @share = Share.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @share }
    end
  end
   def create
   debugger
    @share = Share.new(params[:share])
    @share.item=Item.find(params[:item_id])

    respond_to do |format|
      if @share.save
        flash[:notice] = 'share was successfully created.'
        format.html { redirect_to users_url }
        format.xml  { render :xml => @share, :status => :created, :location => @share }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @share.errors, :status => :unprocessable_entity }
      end
    end
  end
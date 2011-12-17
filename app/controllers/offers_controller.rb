class OffersController < ApplicationController
  # GET /offers
  # GET /offers.xml
  def index      
      
      item = Item.find(params[:item_id])
      user=User.find(current_user.id)
#      user = User.find(params[:current_user_id])
      @offers = item.offers.find(:all)
      @offers2 = user.offers.find(:all)
 #     @offers= Offer.find_all_by_user_id(params[:user_id])
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.xml
  def show
    @offer = Offer.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.xml
  def new
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.xml
  def create
    debugger
    @offer = Offer.new(params[:offer])  
    @offer.item=Item.find(params[:item][:item_id])
         
    #@offer.item=Item.find(params[:item][:My_item_id])    
   # @offer.user=User.find(params[:user_id])
    @offer.My_item_id= params[:item][:My_item_id]
    @offer.my_user_id= current_user.id


    debugger
    #user=    Item.find(params[:item_id])
    respond_to do |format|
      if @offer.save
        flash[:notice] = 'Offer was successfully created.'
        format.html { redirect_to item_offer_url(@offer.item,@offer) }
        format.xml  { render :xml => @offer, :status => :created, :location => @offer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.xml
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        flash[:notice] = 'Offer was successfully updated.'
        format.html { redirect_to(@offer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.xml
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to(offers_url) }
      format.xml  { head :ok }
    end
  end
end

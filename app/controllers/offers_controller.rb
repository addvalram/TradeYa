class OffersController < ApplicationController
  # GET /offers
  # GET /offers.xml   
  def index       
     # @offers = Offer.find_by_sql(["select * from offers where user_id <> ?" ,current_user.id])
     #item = Item.find(params[:item_id])
      user=User.find_by_id(current_user.id)
    # user = User.find(params[:current_user_id])
  #   @offers = item.offers.find(:all)
      @offers = Offer.find_by_sql(["select * from offers where public_user_id = ?",current_user.id])
 #    @offers= Offer.find_all_by_user_id(params[:user_id])      
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
      
        @offer = Offer.new(params[:offer])  
        @offer.item=Item.find(params[:item][:item_id])      
        #@a=Offer.find_by_sql(["select * from offers  where item_id =? and my_item_id=?",params[:item][:item_id],params[:item][:my_item_id]])                  
        @offer_list_validation=Offer.find_by_sql(["select * from offers  where my_item_id =? and offer_respond='offered'",params[:item][:my_item_id]])
        
        if @offer_list_validation.count!=0 
          flash[:notice] = "Sorry !!!! item already offered"
            redirect_to users_path            
          else   
        #@i = Offer.find_by_sql(["select * from offers where item_id = ?",params[:item][:item_id]])
        #  @i.each do |item|
        #    if item.my_item_id = params[:item][:my_item_id]
        #      @c = 1
        #    end
        #  end
        #  if @c == 1
        #    flash[:notice] = "This item already offered"
        #    redirect_to users_path
         # else
              temp_public_user_id=Item.find_by_sql(["select user_id from items where id= ? ",params[:item][:item_id]])             
              @offer.public_user_id=temp_public_user_id[0].user_id                           
              @offer.my_item_id= params[:item][:my_item_id]
              @offer.user_id= current_user.id                      
                  @offer.offer_respond="offered"
                  respond_to do |format|
                  if @offer.save
                      flash[:notice] = 'Offer was successfully created.'
                     format.html { redirect_to users_path }
                      format.xml  { render :xml => @offer, :status => :created, :location => @offer }
                    else
                    format.html { render :action => "new" }
                    format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
                  end         
                end
              end
            end         
 
  # PUT /offers/1
  # PUT /offers/1.xml  
  def update   
    @offer = Offer.find(params[:id])
    
    #@itemUpdate= Item.find_by_sql(["select * from items"])
   # @item=find_by_sql("select * from items where item_id=?",)     
    respond_to do |format|
      if @offer.update_attributes(:offer_respond => "accepted")
        if Offer.update_all({:offer_respond => "traded"},
        ['id <> ? and item_id =?',
         params[:id],params[:item_id]])
         flash[:notice] = 'Offer Traded was successfully updated.'
        else
                flash[:notice] = 'Offer Traded Not Updared.'
        end         
       # set offer_respond=>"traded" where item_id=params[:item][:item_id]       
        
        flash[:notice] = 'Offer was successfully updated.'
        format.html { redirect_to users_url }
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
  


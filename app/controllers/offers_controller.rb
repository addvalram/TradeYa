class OffersController < ApplicationController
  # GET /offers
  # GET /offers.xml   
  def index            
      @offers = Offer.find_by_sql(["select * from offers where user_id<>?",current_user.id])
     #item = Item.find(params[:item_id])
      user=User.find(current_user.id)
#     user = User.find(params[:current_user_id])
  #    @offers = item.offers.find(:all)
      @offers2 = user.offers.find(:all)
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
      @c = 0
        @offer = Offer.new(params[:offer])  
        @offer.item=Item.find(params[:item][:item_id])
        @i = Offer.find_by_sql(["select * from offers where item_id = ?",params[:item][:item_id]])
          @i.each do |item|
            if item.my_item_id = params[:item][:my_item_id]
              @c = 1
            end
          end
          if @c == 1
            flash[:notice] = "This item already offered"
            redirect_to users_path
          else
              temp_public_user_id=Item.find_by_sql(["select user_id from items where id= ? ",params[:item][:item_id]])             
              @offer.public_user_id=temp_public_user_id[0].user_id                           
              @offer.my_item_id= params[:item][:my_item_id]
              @offer.user_id= current_user.id                      
                  @offer.offer_status=1
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
    debugger
    @offer = Offer.find(params[:id])
    @itemUpdate= Item.find_by_sql(["select * from items"])
   # @item=find_by_sql("select * from items where item_id=?",)     
    respond_to do |format|
      if @offer.update_attributes(:offer_respond => "accepted")
       @itemUpdate=Item.update_all({:user_id => current_user.id},{:id=>params[:item_id]})
       #UserProduct.update_all({:is_temporary => false}, {:user_id => 12345})
        
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
  


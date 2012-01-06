class OffersController < ApplicationController
  # GET /offers
  # GET /offers.xml
  def index
     #@offer= Offer.find(:all).paginate(:per_page=>3,:page=>params[:page])
    user=User.find_by_id(current_user.id)
    #@user_item = Item.paginate(:per_page=>2,:page=>params[:page]) 
    # @offers = item.offers.find(:all)
    @my_current_offers = Offer.find_by_sql(["select * from offers where public_user_id = ? and offer_respond=?",current_user.id,"offered"])
    @sendOffers=Offer.find_by_sql(["select * from offers where user_id=? and offer_respond=?",current_user.id,"offered"])
    # @offers= Offer.find_all_by_user_id(params[:user_id])
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
    @offer.item=Item.find(params[:user_item_id])
    @offer_list_validation=Offer.find_by_sql(["select * from offers  where my_item_id =? and offer_respond='offered'",params[:item_id]])
    @offer_list=Offer.find_by_sql(["select * from offers  where item_id =? and offer_respond='accepted' or my_item_id=?",params[:user_item_id],params[:user_item_id]])
    if @offer_list_validation.count!=0
    flash[:notice] = "Sorry !!!! item already offered"
    redirect_to users_path
    elsif
    @offer_list.count!=0
    flash[:notice]="Sorry item is already traded"
    redirect_to users_path

    else
      temp_public_user_id=Item.find_by_sql(["select user_id from items where id= ? ",params[:user_item_id]])
      @offer.public_user_id=temp_public_user_id[0].user_id
      @offer.my_item_id= params[:item_id]
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

  def reject_offer
    @offer=Offer.find(params[:id])
    #id=User.find_by_id(current_user.id)
     if @offer.update_attributes(:offer_respond=>"reject")
    flash[:notice]='Offer rejected sucessfully .'
    redirect_to users_path
    else
      flash[:notice]='offer was not rejected'
      resopnd_to do |fromat|
        format.html {render :action=>edit}
        format.xml {render :xml=>@offer.errors,:status=>:unprocessable_entitys}
      end
    end
  end

  def revoke_offer
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(:offer_respond => "revoke")
    flash[:notice] = 'Offer revoked sucessfully  .'
    redirect_to users_path
    else
      flash[:notice]='offer was not canceled.'
      respond_to do |format|
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.xml
  def update

    #@itemUpdate= Item.find_by_sql(["select * from items"])
    #@item=find_by_sql("select * from items where item_id=?",)

    @offer = Offer.find(params[:id])
    item1 = Item.find(params[:item_id])
    item2 = Item.find(params[:item])
    #@itemUpdate= Item.find_by_sql(["select * from items"])
    #@item=find_by_sql("select * from items where item_id=?",)

    respond_to do |format|

      if @offer.update_attributes(:offer_respond => "accepted")
        item1.update_attributes(:status => "close")
        item2.update_attributes(:status => "close")
        if Offer.update_all({:offer_respond => "rejected"},
        ['id <> ? and item_id =?',params[:id],params[:item_id]])
        flash[:notice] = 'Offer Traded was successfully updated.'
        else
        flash[:notice] = 'Updation Invalid'
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
      format.html { redirect_to(item_offers_url) }
      format.xml  { head :ok }
    end
  end
end


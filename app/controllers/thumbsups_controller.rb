class ThumbsupsController < ApplicationController
  # GET /thumbsups
  # GET /thumbsups.xml
  def index
    debugger
    offer=Offer.find(params[:offer_id])
    @thumbsups = offer.thumbsups.find(:all)
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thumbsups }
    end
  end

  # GET /thumbsups/1
  # GET /thumbsups/1.xml
  def show
    @thumbsup = Thumbsup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thumbsup }
    end
  end

  # GET /thumbsups/new
  # GET /thumbsups/new.xml
  def new
    debugger
    @thumbsup = Thumbsup.new
    @offer = params[:offer_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thumbsup }
    end
  end

  # GET /thumbsups/1/edit
  def edit
    @thumbsup = Thumbsup.find(params[:id])
  end

  # POST /thumbsups
  # POST /thumbsups.xml
  def create
    debugger
    @thumbsup = Thumbsup.new(params[:thumbsup])
    @thumbsup.offer=Offer.find(params[:offer_id])
    

    respond_to do |format|
      if @thumbsup.save
        flash[:notice] = 'Thumbsup was successfully created.'
        format.html { redirect_to users_url}
        format.xml  { render :xml => @thumbsup, :status => :created, :location => @thumbsup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thumbsup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thumbsups/1
  # PUT /thumbsups/1.xml
  def update
    @thumbsup = Thumbsup.find(params[:id])

    respond_to do |format|
      if @thumbsup.update_attributes(params[:thumbsup])
        flash[:notice] = 'Thumbs up was successfully updated.'
        format.html { redirect_to(@thumbsup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thumbsup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbsups/1
  # DELETE /thumbsups/1.xml
  def destroy
    @thumbsup = Thumbsup.find(params[:id])
    @thumbsup.destroy

    respond_to do |format|
      format.html { redirect_to(thumbsups_url) }
      format.xml  { head :ok }
    end
  end
end

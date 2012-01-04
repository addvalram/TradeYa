class ThumbsdownsController < ApplicationController
  # GET /thumbsdowns
  # GET /thumbsdowns.xml
  def index
    @thumbsdowns = Thumbsdown.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @thumbsdowns }
    end
  end

  # GET /thumbsdowns/1
  # GET /thumbsdowns/1.xml
  def show
    @thumbsdown = Thumbsdown.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thumbsdown }
    end
  end

  # GET /thumbsdowns/new
  # GET /thumbsdowns/new.xml
  def new
    @thumbsdown = Thumbsdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thumbsdown }
    end
  end

  # GET /thumbsdowns/1/edit
  def edit
    @thumbsdown = Thumbsdown.find(params[:id])
  end

  # POST /thumbsdowns
  # POST /thumbsdowns.xml
  def create
    @thumbsdown = Thumbsdown.new(params[:thumbsdown])

    respond_to do |format|
      if @thumbsdown.save
        flash[:notice] = 'Thumbsdown was successfully created.'
        format.html { redirect_to(@thumbsdown) }
        format.xml  { render :xml => @thumbsdown, :status => :created, :location => @thumbsdown }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thumbsdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thumbsdowns/1
  # PUT /thumbsdowns/1.xml
  def update
    @thumbsdown = Thumbsdown.find(params[:id])

    respond_to do |format|
      if @thumbsdown.update_attributes(params[:thumbsdown])
        flash[:notice] = 'Thumbsdown was successfully updated.'
        format.html { redirect_to(@thumbsdown) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thumbsdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbsdowns/1
  # DELETE /thumbsdowns/1.xml
  def destroy
    @thumbsdown = Thumbsdown.find(params[:id])
    @thumbsdown.destroy

    respond_to do |format|
      format.html { redirect_to(thumbsdowns_url) }
      format.xml  { head :ok }
    end
  end
end

class RecentActivitiesController < ApplicationController
  # GET /recent_activities
  # GET /recent_activities.xml
  def index
    @recent_activities = RecentActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recent_activities }
    end
  end

  # GET /recent_activities/1
  # GET /recent_activities/1.xml
  def show
    @recent_activity = RecentActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recent_activity }
    end
  end

  # GET /recent_activities/new
  # GET /recent_activities/new.xml
  def new
    @recent_activity = RecentActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recent_activity }
    end
  end

  # GET /recent_activities/1/edit
  def edit
    @recent_activity = RecentActivity.find(params[:id])
  end

  # POST /recent_activities
  # POST /recent_activities.xml
  def create
    @recent_activity = RecentActivity.new(params[:recent_activity])

    respond_to do |format|
      if @recent_activity.save
        flash[:notice] = 'RecentActivity was successfully created.'
        format.html { redirect_to(@recent_activity) }
        format.xml  { render :xml => @recent_activity, :status => :created, :location => @recent_activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recent_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recent_activities/1
  # PUT /recent_activities/1.xml
  def update
    @recent_activity = RecentActivity.find(params[:id])

    respond_to do |format|
      if @recent_activity.update_attributes(params[:recent_activity])
        flash[:notice] = 'RecentActivity was successfully updated.'
        format.html { redirect_to(@recent_activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recent_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recent_activities/1
  # DELETE /recent_activities/1.xml
  def destroy
    @recent_activity = RecentActivity.find(params[:id])
    @recent_activity.destroy

    respond_to do |format|
      format.html { redirect_to(recent_activities_url) }
      format.xml  { head :ok }
    end
  end
end

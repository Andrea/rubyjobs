class JobsController < ApplicationController
	
  def index
    @jobs = Job.recent.search_for(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
			format.rss
			format.js
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  def new
    @job = Job.new
		@types = Type.all
		@locations = Location.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  def edit
    @job = find_job_from_params
  end

  def create
    @job = Job.new(params[:job])
		@types = Type.all
		@locations = Location.all

    respond_to do |format|
      if @job.save
				JobMailer.deliver_confirmation(@job)
	
        flash[:notice] = 'Job was successfully created.'
        format.html { redirect_to(@job) }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update 
    @job = find_job_from_params

    respond_to do |format|
      if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        format.html { redirect_to(@job) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @job = find_job_from_params
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end

	private
	
	def find_job_from_params #TODO: GJ: this will require a secret key which will be emailed to the poster
		Job.find(params[:id])
	end
end

require File.join(File.dirname(__FILE__), '..', "spec_helper" )
require File.dirname(__FILE__) + '/../factory'

include Factory
include AuthenticatedTestHelper

describe JobsController do
	integrate_views

	describe "the index action" do
		before do
			@job = Factory.create_job
			get :index
		end

		it "should render correctly" do
			response.should be_success
		end
		
		it "should render correctly as RSS" do #NOTE: GJ: this is resulting in a 406 response. what is the correct way to spec formats?
			#get :index, :format => :rss
			#response.should be_success
			pending
		end

		it "should assign a jobs collection" do
			assigns[:jobs].should_not be_nil
			assigns[:jobs][0].should == @job
		end

		describe "when there are jobs to display" do
			it "should list the most recent jobs" do
				response.should have_tag("ul#job_list")
			end
		end

		describe "when there are no jobs to display" do
			before do
				Job.destroy_all
				get :index
			end
			
			it "should show a message indicating that there are no jobs" do
				response.should have_tag("span#no_jobs")
			end

			it "should not display a list of jobs" do
				get :index
				response.should_not have_tag("ul#job_list")
			end
		end
		
		describe "when a search term is provided" do
			it "should render correctly" do
				get :index, {:search => 'merb'}
				response.should be_success
			end
			
			it "should assign jobs which contain the search term"
			it "should not assign jobs which do not contain the search term"
		end
	end

	describe "the show action" do
		before do
			@job = Factory.create_job
			get 'show', :id => @job
		end
		
		it "should be successful" do
			response.should be_success
		end
		
		it "should assign the job" do
			assigns[:job].should == @job
		end
	end

	describe "the new action" do
		it "should have specs"
	end

	describe "the edit action" do
		it "should have specs"
	end

	describe "the create action" do
		it "should have specs"
	end

	describe "the update action" do
		it "should have specs"
	end

	describe "the destroy action" do
		it "should have specs"
	end

end

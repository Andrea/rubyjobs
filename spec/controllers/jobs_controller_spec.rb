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
			response.should render_template 'index'
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

			it "should not display any jobs in the table" do
				get :index
				response.should_not have_tag("tr.job")
			end
		end

		describe "when a search term is provided" do
			it "should render correctly" do
				get :index, {:search => 'merb'}
				response.should be_success
				response.should render_template 'index'
			end

			it "should link to an RSS feed for the search term" do
				get :index, {:search => 'merb'}
				response.should have_text(/a\shref=\"http.+jobs\.rss\?search=merb"/)
				response.should have_text(/RSS feed\s* for 'merb'/)
			end

			it "should assign jobs which contain the search term"
			it "should not assign jobs which do not contain the search term"
		end

		describe "when a search term including << is provided" do
			before do
				get :index, {:search => 'merb<<'}
			end

			it "should render correctly" do
				response.should be_success
			end

			it "should link to an RSS feed for the search term" do
				lt = CGI.escape('<')

				response.should have_text(/a\shref=\"http.+jobs\.rss\?search=merb#{lt}#{lt}"/)
				response.should have_text(/RSS feed\s* for 'merb&lt;&lt;'/)
			end
		end
	end

	describe "the show action" do
		before do
			@job = Factory.create_job
			get 'show', :id => @job
		end

		it "should be successful" do
			response.should be_success
			response.should render_template 'show'
		end

		it "should assign a job" do
			assigns[:job].should == @job
		end
	end

	describe "the new action" do
		before do
			get :new
		end

		it "should be successful" do
			response.should be_success
			response.should render_template 'new'
		end

		it "should assign a job" do
			assigns[:job].should_not be_nil
			assigns[:job].should be_an_instance_of Job
		end

		it "should have more specs"

	end

	describe "the edit action" do
		describe "with a valid action key" do
			before do
				@job = Factory.create_job
				get :edit, { :id => @job, :key => @job.key }
			end
			
			it "should be successful" do
				response.should be_success
				response.should render_template 'edit'
			end

			it "should assign a job" do
				assigns[:job].should == @job
			end
			
			it "should display the edit form with a hidden key field" do
				response.should have_tag("form.edit_job") do
					with_tag "input[type=hidden][name=key]", :content => @job.key
				end
			end
		end
		
		describe "with no action key" do
			before do
				@job = Factory.create_job
				get :edit, { :id => @job }
			end
			
			it "should redirect to homepage" do
				response.should be_redirect
			end
		end
		
		describe "with an invalid action key" do
			before do
				@job = Factory.create_job
				get :edit, { :id => @job, :key => "abc#{@job.key}" }
			end
			
			it "should redirect to homepage" do
				response.should be_redirect
			end
		end
	end

	describe "the create action" do
		describe "with valid attributes" do
			it "should create and redirect to the new job" do
				Job.count.should == 0
				post 'create', { :job => Factory.new_job.attributes }
				Job.count.should == 1
				response.should be_redirect #TODO: GJ: test for view action
				flash[:notice].should_not == nil
			end

			it "should send an email" do
				JobMailer.should_receive(:deliver_confirmation)
				post 'create', { :job => Factory.new_job.attributes }
			end
		end
		
		describe "with invalid attributes" do
			before do
				post 'create', { :job => Factory.new_job(:title => nil).attributes }
			end
			
			it "should not create a job" do
				Job.count.should == 0
			end
			
			it "should show an error message" do
				response.should have_tag("div.errorExplanation")
			end
		end
	end

	describe "the update action" do
		it "should have specs"
	end

	describe "the destroy action" do
		it "should have specs"
	end

end

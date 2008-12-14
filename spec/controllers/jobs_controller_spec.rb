require File.join(File.dirname(__FILE__), '..', "spec_helper" )
include AuthenticatedTestHelper

describe JobsController do
	integrate_views
	
	describe "the index action" do

		it "should render correctly" do
			get :index
			response.should be_success
		end
		
		it "should assign a jobs collection" do
			get :index
			assigns[:jobs].should_not be_nil
		end
		
		describe "when there are jobs to display" do
			it "should list the most recent jobs"
		end
		
		describe "when there are no jobs to display" do
			it "should show a message indicating that there are no jobs"
		end
		
		it "should have more specs"
		
	end
	
	describe "the show action" do
		it "should have specs"
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

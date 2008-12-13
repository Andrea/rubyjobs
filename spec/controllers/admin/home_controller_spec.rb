require File.join(File.dirname(__FILE__), '../..', "spec_helper" )
include AuthenticatedTestHelper

describe Admin::HomeController do
	fixtures :users
	
	describe "for an anonymous user" do
		it "should redirect to the homepage" do
			get :index
			response.should be_redirect
		end
	end
	
	describe "for an admin" do
		it "should display the hompage" do
			login_as :quentin
			get :index
			response.should be_success
		end
	end

end

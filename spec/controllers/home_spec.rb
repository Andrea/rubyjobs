require File.join(File.dirname(__FILE__), '..', "spec_helper" )

describe HomeController do

	it "should render the homepage" do
		get :index
		response.should be_success
	end

end

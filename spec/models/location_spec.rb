require File.dirname(__FILE__) + '/../spec_helper'

describe Location do
	
	valid_attributes = {
		:name => 'Dublin'
	}
	
	describe "validations" do
		before do
			@location = Location.new
		end
		
		it "should be valid with valid attributes" do
			@location.attributes = valid_attributes
			@location.should be_valid
		end
		
		it "should ensure that a name is provided" do
			@location.attributes = valid_attributes.except(:name)
			@location.should_not be_valid
			@location.errors.on(:name).should_not be_nil
		end

	end
end

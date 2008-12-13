require File.dirname(__FILE__) + '/../spec_helper'

describe Type do
	
	valid_attributes = {
		:name => 'Contract'
	}
	
	describe "validations" do
		before do
			@type = Type.new
		end
		
		it "should be valid with valid attributes" do
			@type.attributes = valid_attributes
			@type.should be_valid
		end
		
		it "should ensure that a name is provided" do
			@type.attributes = valid_attributes.except(:name)
			@type.should_not be_valid
			@type.errors.on(:name).should_not be_nil
		end

	end
end

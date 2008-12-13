require File.dirname(__FILE__) + '/../spec_helper'

describe Job do
	
	valid_attributes = {
		:company_name 			=> 'ACME Inc.',
		:company_website 		=> 'www.acme.org',
		:company_email			=> 'jobs@acme.org',
		:type_id						=> 1,
		:location_id				=> 1,
		:title							=> 'Rails developer required for greenfield project',
		:description				=> 'We are planning on revamping our online store and need someone to build the Rails application',
		:how_to_apply				=> 'Email jobs@acme.org or call 01-1234567'
	}
	
	describe "validations" do
		before do
			@job = Job.new
		end
		
		it "should be valid with valid attributes" do
			@job.attributes = valid_attributes
			@job.should be_valid
		end
		
		it "should ensure that a company_name is provided" do
			@job.attributes = valid_attributes.except(:company_name)
			@job.should_not be_valid
			@job.errors.on(:company_name).should_not be_nil
		end
		
		it "should ensure that a company_email is provided" do
			@job.attributes = valid_attributes.except(:company_email)
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end
		
		it "should ensure that company_email is a valid email" do
			@job.attributes = valid_attributes.with(:company_email => 'invalid@email')
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end
		
		it "should ensure that a type_id is provided" do
			pending
		end
		
		it "should ensure that a title is provided" do
			@job.attributes = valid_attributes.except(:title)
			@job.should_not be_valid
			@job.errors.on(:title).should_not be_nil
		end
		
		it "should ensure that a description is provided" do
			@job.attributes = valid_attributes.except(:description)
			@job.should_not be_valid
			@job.errors.on(:description).should_not be_nil
		end
		
		it "should ensure that a how_to_apply is provided" do
			@job.attributes = valid_attributes.except(:how_to_apply)
			@job.should_not be_valid
			@job.errors.on(:how_to_apply).should_not be_nil
		end
	end
end

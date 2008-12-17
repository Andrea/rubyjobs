require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../factory'
include Factory

describe Job do
	describe "validations" do
		it "should be valid with valid attributes" do
			@job = Factory.create_job
			@job.should be_valid
		end
		
		it "should ensure that a company_name is provided" do
			@job = Factory.new_job(:company_name => nil)
			@job.should_not be_valid
			@job.errors.on(:company_name).should_not be_nil
		end
		
		it "should ensure that a company_email is provided" do
			@job = Factory.new_job(:company_email => nil)
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end

		it "should ensure that company_email is a valid email" do
			@job = Factory.new_job(:company_email => 'invalid@email')
			@job.should_not be_valid
			@job.errors.on(:company_email).should_not be_nil
		end

		it "should ensure that a type_id is provided" do
			@job = Factory.new_job(:type_id => nil)
			@job.should_not be_valid
			@job.errors.on(:type_id).should_not be_nil
		end

		it "should ensure that a location_id is provided" do
			@job = Factory.new_job(:location_id => nil)
			@job.should_not be_valid
			@job.errors.on(:location_id).should_not be_nil
		end

		it "should ensure that a title is provided" do
			@job = Factory.new_job(:title => nil)
			@job.should_not be_valid
			@job.errors.on(:title).should_not be_nil
		end

		it "should ensure that a description is provided" do
			@job = Factory.new_job(:description => nil)
			@job.should_not be_valid
			@job.errors.on(:description).should_not be_nil
		end

		it "should ensure that a how_to_apply is provided" do
			@job = Factory.new_job(:how_to_apply => nil)
			@job.should_not be_valid
			@job.errors.on(:how_to_apply).should_not be_nil
		end
	end

	describe "searching" do
		it "should be searchable" do
			Job.should respond_to(:search_for)
		end
		
		it "should search the company_name"
		it "should search the title"
		it "should search the description"
		it "should search the how_to_apply"
		it "should search the location"
		it "should search the type"
	end
end
